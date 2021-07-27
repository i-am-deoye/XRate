//
//  CurrencySymbolsResponse.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation



struct CurrencySymbolsResponse {
    let motd : Motd?
    let success : Bool
    let symbols : [CurrencySymbol]
}

extension CurrencySymbolsResponse : Decodable {
    enum CurrencySymbolsResponseKeys : String, CodingKey {
        case motd
        case success
        case symbols
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CurrencySymbolsResponseKeys.self)
        self.motd = try container.decodeIfPresent(Motd.self, forKey: .motd)
        self.success = try container.decodeIfPresent(Bool.self, forKey: .success) ?? false
        self.symbols = try container.decodeIfPresent([CurrencySymbol].self, forKey: .symbols) ?? []
    }
}
