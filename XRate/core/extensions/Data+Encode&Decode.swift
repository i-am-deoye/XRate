//
//  Data+Encode&Decode.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation



extension Data {
    func decode<R:Decodable> (_ type: R.Type) -> R? {
        let decoder = JSONDecoder.init()
        do {
            let value = try decoder.decode(type, from: self)
            return value
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    static func decode<R:Decodable> (_ type: R.Type, data: Data) -> R? {
        let decoder = JSONDecoder.init()
        do {
            let value = try decoder.decode(type, from: data)
            return value
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
