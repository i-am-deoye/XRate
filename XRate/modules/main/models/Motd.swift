//
//  Motd.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation



struct Motd : Hashable {
    let message: String
    let url: String
}

extension Motd : Decodable {
    enum MotdKeys : String, CodingKey {
        case msg
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MotdKeys.self)
        self.message = try container.decodeIfPresent(String.self, forKey: .msg) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
