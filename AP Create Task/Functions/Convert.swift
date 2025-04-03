//
//  Convert.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import Foundation

func convertToBinary(number: Int) -> [Binary] {
    var binaryResult: [Binary] = []
    var num = number

    if num == 0 {
        return [Binary(digit: 0)]
    }

    while num > 0 {
        let remainder = num % 2
        binaryResult.append(Binary(digit: remainder))
        num = num / 2
    }

    return binaryResult.reversed()
}
