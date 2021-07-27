//
//  CurrencySymbol.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation



struct CurrencySymbol : Identifiable {
    var id = UUID()
    let descriptionValue : String
    let code : String
}


extension CurrencySymbol : Decodable {
    enum CurrencySymbolKeys: String, CodingKey {
        case description
        case code
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CurrencySymbolKeys.self)
        self.descriptionValue = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
    }
}
