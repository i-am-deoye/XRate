//
//  ResponsesErrors.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


enum ResponsesErrors : String, Error {
    case internalParsedDataError = "Something went wrong, we surely looking into this."
    case generalError = "generalError"
    
   static func getType(_ message: String) -> ResponsesErrors {
        if ResponsesErrors.internalParsedDataError.rawValue == message { return .internalParsedDataError}
        
        return .internalParsedDataError
    }
}
