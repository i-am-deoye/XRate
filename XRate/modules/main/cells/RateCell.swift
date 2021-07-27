//
//  RateCell.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import SwiftUI



struct RateCell: View {
    var rate : Rate
    var body: some View {
        NavigationLink(destination: DetailContentView.init(rate: rate)) {
            
            Text("\(rate.name) . \(rate.value)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
