//
//  RatesResponse.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


struct RatesResponse {
    let motd : Motd?
    let success : Bool
    let base: String
    let date: String
    let rates : [String:Double]
    
    lazy var rateCollection : [Rate] = {
        return rates.lazy.compactMap({ Rate.init(name: $0.key, value: $0.value) })
    }()
}

extension RatesResponse : Decodable {
    enum RatesResponseKeys : String, CodingKey {
        case motd
        case success
        case base
        case date
        case rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RatesResponseKeys.self)
        self.motd = try container.decodeIfPresent(Motd.self, forKey: .motd)
        self.success = try container.decodeIfPresent(Bool.self, forKey: .success) ?? false
        self.base = try container.decodeIfPresent(String.self, forKey: .base) ?? ""
        self.date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        self.rates = try container.decodeIfPresent([String:Double].self, forKey: .rates) ?? [:]
    }
}
