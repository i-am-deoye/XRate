//
//  MainEndpoints.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation




enum MainEndpoints : String, IEndPoints {
    case fetch_all_supported_currency_symbols = "/symbols"
    case fetch_latest_rates = "/latest?"
    
    
    func getValue() -> String {
        return self.rawValue
    }
    
    
    func getEnvUrl() -> BaseEnvUrl {
        return .exchange_rate
    }
}
