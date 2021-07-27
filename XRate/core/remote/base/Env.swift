//
//  Env.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


struct ENVIRONMENT {
    static let value = Env.staged
    private init(){}
}

enum Env {
    case staged
    
    func get_url(_ env: BaseEnvUrl) -> String {
        switch env {
        case .exchange_rate:
            return ExchangeRate.getUrl(self)
        }
    }
}
