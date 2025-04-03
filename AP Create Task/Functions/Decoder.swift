//
//  Decoder.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import Foundation

func decodeFromBinary(binaryNumber: Int) -> Int {
    var numResult = 0
    var binaryNum = binaryNumber
    var power = 0

    while binaryNum > 0 {
        let lastDigit = binaryNum % 10 // get the rightmost digit
        numResult += lastDigit * Int(pow(2.0, Double(power)))
        power += 1
        binaryNum /= 10
    }

    return numResult
}
