//
//  MainRepository.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


protocol MainDatasource {
    func fetchAllSupportedCurrencySymbols(_ handler: @escaping ((Result<CurrencySymbolsResponse, String>) -> Void) )
    func fetchLatestRates(_ base: String, amount: String, handler: @escaping ((Result<RatesResponse, String>) -> Void))
}

final class MainRepository : MainDatasource {
    static let instance = MainRepository()
    
    
    
    func fetchAllSupportedCurrencySymbols(_ handler: @escaping ((Result<CurrencySymbolsResponse, String>) -> Void)) {
        MainEndpoints.fetch_all_supported_currency_symbols.connect(method: .get, handler: handler)
    }
    
    func fetchLatestRates(_ base: String, amount: String, handler: @escaping ((Result<RatesResponse, String>) -> Void)) {
        let query = "base=\(base)&amount=\(amount)"
        MainEndpoints.fetch_latest_rates.connect(method: .get, pathQuery: query, handler: handler)
    }
}
