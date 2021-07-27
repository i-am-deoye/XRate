//
//  Rate.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


struct Rate : Identifiable {
    var id = UUID()
    let name: String
    let value : Double
}
