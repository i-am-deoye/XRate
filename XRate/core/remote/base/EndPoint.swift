//
//  EndPoint.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation






protocol IEndPoints {
    func getValue() -> String
    func getEnvUrl() -> BaseEnvUrl
}


extension IEndPoints {
    
    func getUrlfullPath() -> String {
        return ENVIRONMENT.value.get_url(getEnvUrl()) + self.getValue()
    }
    
}

extension IEndPoints {
    
    func connect<R>(method: Method, pathQuery: String = "", handler: @escaping ((Result<R, String>) -> Void)) where R : Decodable {
        Remote.init().connect(method: method, endpoint: self, pathQuery: pathQuery,  handler: handler)
    }
    
}



