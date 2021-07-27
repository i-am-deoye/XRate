//
//  MainUsecase.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


protocol IMainUsecase {
    func fetchAllSupportedCurrencySymbols(_ handler: @escaping ((XRState<[CurrencySymbol]>) -> Void) )
    func fetchLatestRates(_ base: String, amount: String, handler: @escaping ((XRState<[Rate]>) -> Void))
}

class MainUsecase : IMainUsecase {

    private let repository: MainDatasource
    private var fetchAllSupportedCurrencySymbolsStateHandler : ((XRState<[CurrencySymbol]>) -> Void)?
    private var fetchLatestRatesStateHandler : ((XRState<[Rate]>) -> Void)?
    
    init(_ repository: MainDatasource) {
        self.repository = repository
    }
    
    
    func fetchAllSupportedCurrencySymbols(_ handler: @escaping ((XRState<[CurrencySymbol]>) -> Void)) {
        fetchAllSupportedCurrencySymbolsStateHandler = handler
        fetchAllSupportedCurrencySymbolsStateHandler?(.loading)
        repository.fetchAllSupportedCurrencySymbols(onFetchedAllSupportedCurrencySymbols)
    }
    
    
    func fetchLatestRates(_ base: String, amount: String = "1", handler: @escaping ((XRState<[Rate]>) -> Void)) {
        fetchLatestRatesStateHandler = handler
        fetchLatestRatesStateHandler?(.loading)
        repository.fetchLatestRates(base, amount: amount, handler: onFetchedLatestRates)
    }
}


fileprivate extension MainUsecase {
    
    func onFetchedAllSupportedCurrencySymbols(_ result: Result<CurrencySymbolsResponse, String>) {
        switch result {
        case .failure(error: let message):
            fetchAllSupportedCurrencySymbolsStateHandler?(.failure(error: message))
        case .success(payload: let response):
            if response.success {
                fetchAllSupportedCurrencySymbolsStateHandler?(.result(payload: response.symbols))
            } else {
                if let message = response.motd?.message {
                    fetchAllSupportedCurrencySymbolsStateHandler?(.failure(error: message))
                } else {
                    fetchAllSupportedCurrencySymbolsStateHandler?(.failure(error: ResponsesErrors.generalError.rawValue))
                }
            }
        }
    }
    
    
    func onFetchedLatestRates(_ result: Result<RatesResponse, String>) {
        switch result {
        case .failure(error: let message):
            fetchLatestRatesStateHandler?(.failure(error: message))
        case .success(payload: var response):
            if response.success {
                fetchLatestRatesStateHandler?(.result(payload: response.rateCollection))
            } else {
                if let message = response.motd?.message {
                    fetchLatestRatesStateHandler?(.failure(error: message))
                } else {
                    fetchLatestRatesStateHandler?(.failure(error: ResponsesErrors.generalError.rawValue))
                }
            }
        }
    }
}
