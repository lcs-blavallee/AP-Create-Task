//
//  HistoryView.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import SwiftUI

import SwiftUI

struct HistoryView: View {
    let previousResults: [ConversionRecord]

    var body: some View {
        VStack(alignment: .leading) {
            Text("History")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)

            List(previousResults.reversed(), id: \.id) { record in
                switch record.type {
                case .decimalToBinary:
                    Text("Decimal \(record.input) → Binary \(record.output)")
                case .binaryToDecimal:
                    Text("Binary \(record.input) → Decimal \(record.output)")
                }
            }
            .frame(maxHeight: 200) // adjust this height as you like
            .listStyle(.plain)
        }
        .padding()
    }
}

