//
//  HistoryView.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

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
                case .decimalToBinary: // if the record type is decimal to binary
                    Text("Decimal \(record.input) → Binary \(record.output)") // display this
                case .binaryToDecimal: // if the record type is binary to decimal
                    Text("Binary \(record.input) → Decimal \(record.output)") // display this
                }
            }
            .frame(maxHeight: 200)
            .listStyle(.plain)
        }
        .padding()
    }
}

