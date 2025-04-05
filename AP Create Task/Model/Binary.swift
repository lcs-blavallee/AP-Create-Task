//
//  Binary.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import Foundation

// This struct represents a single binary digit (0 or 1).

struct Binary: Identifiable, Equatable {
    let id = UUID()
    let digit: Int
}

// This struct represents a record of a number conversion

struct ConversionRecord: Identifiable {
    let id = UUID()
    let input: String
    let output: String
    let type: ConversionType

    enum ConversionType {
        case decimalToBinary
        case binaryToDecimal
    }
}
