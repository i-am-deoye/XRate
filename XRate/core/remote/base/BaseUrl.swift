//
//  BaseUrl.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation



protocol IBaseEnvUrl {
    func getUrl(_ env: Env) -> String
}

enum  BaseEnvUrl {
    case exchange_rate
}

enum ExchangeRate : String {
    case staged = "https://api.exchangerate.host"
    
    static func getUrl(_ env: Env) -> String {
        switch env {
        case .staged : return ExchangeRate.staged.rawValue
        }
    }
}
