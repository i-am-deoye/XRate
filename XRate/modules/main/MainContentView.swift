//
//  MainContentView.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
///Users/moses/Documents/xrate-kfrtlu/XRate/XRate

import SwiftUI

struct MainContentView: View {
    @ObservedObject var viewModel = MainViewModel.init(MainUsecase.init(MainRepository.instance))
    @State var selectedBase : String = "USD"
    
    var body: some View {
        NavigationView{
            List() {
                ForEach(viewModel.rates) { rate in
                    RateCell.init(rate: rate)
                }
            }
        }
        .onAppear {
            viewModel.fetchLatestRates(selectedBase, amount: "120")
        }
    
    }
    
    
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}






