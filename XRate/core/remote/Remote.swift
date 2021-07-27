//
//  Remote.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation
import Combine


protocol IRemote {
    func connect<R>(method: Method,
                    endpoint: IEndPoints,
                    pathQuery: String,
                    handler: @escaping ((Result<R, String>) -> Void)) where R : Decodable
}


final class Remote: IRemote {
    private var session : URLSession
    private var cancelableURLSession : AnyCancellable?
    
    
    public init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 1200
        session = URLSession.init(configuration: configuration)
    }
    
    func connect<R>(method: Method, endpoint: IEndPoints,pathQuery: String, handler: @escaping ((Result<R, String>) -> Void)) where R : Decodable {
        configure(method: method, endpoint: endpoint, pathQuery: pathQuery, handler: handler)
    }
    
}




fileprivate extension Remote {
    func configure<R>(method: Method, endpoint: IEndPoints, pathQuery: String, handler: @escaping ((Result<R, String>) -> Void)) where R : Decodable {
        
        let fullURL = endpoint.getUrlfullPath() + pathQuery
        
        
        guard let url = URL.init(string: fullURL) else {
            assertionFailure("unable to convert url String to URL type")
            return
        }
        
        
        
        var request = URLRequest(url: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        self.session.dataTask(with: request, completionHandler: {(data, response, error) in
            
            DispatchQueue.main.async {
                
                print(String.init(data: data ?? Data() , encoding: .utf8)!)

                
                
                if let decoded : R = data?.decode(R.self) {
                    handler(Result.success(payload: decoded))
                } else {
                    handler(Result.failure(error: ResponsesErrors.internalParsedDataError.rawValue))
                }
            }
            
        }).resume()
        
    }
}
