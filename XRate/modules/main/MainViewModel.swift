//
//  MainViewModel.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation
import Combine



class MainViewModel : ObservableObject {
    @Published var loading = false
    @Published var errorMessage = ""
    @Published var currencySymbols = [CurrencySymbol]()
    @Published var rates = [Rate]()
    
    private let usecase : IMainUsecase
    
    init(_ usecase : IMainUsecase ) {
        self.usecase = usecase
    }
    
    private var cancelableURLSession : AnyCancellable?
    
    
    func fetchAllSupportedCurrencySymbols() {
        usecase.fetchAllSupportedCurrencySymbols(onFetchAllSupportedCurrencySymbolsState)
    }
    
    
    func fetchLatestRates(_ base: String, amount: String) {
        usecase.fetchLatestRates(base, amount: amount, handler: onFetchLatestRates)
    }
}



fileprivate extension MainViewModel {
    
    func onFetchAllSupportedCurrencySymbolsState(_ state: XRState<[CurrencySymbol]>) {
        self.loading = false
        
        switch state {
        case .loading:
            self.loading = true
        case .failure(error: let message):
            self.errorMessage = message
        case .result(payload: let currencies):
            self.currencySymbols = currencies
        }
    }
    
    func onFetchLatestRates(_ state: XRState<[Rate]>) {
        self.loading = false
        
        switch state {
        case .loading:
            self.loading = true
        case .failure(error: let message):
            self.errorMessage = message
        case .result(payload: let rates):
            self.rates = rates
        }
    }
}
