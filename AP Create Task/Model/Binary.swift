//
//  Binary.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import Foundation

struct Binary: Identifiable, Equatable {
    let id = UUID()
    let digit: Int
}

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
