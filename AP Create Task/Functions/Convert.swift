//
//  Convert.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import Foundation

// function to convert to binary using "division-by-2" algorithm

func convertToBinary(number: Int) -> [Binary] {
    var binaryResult: [Binary] = [] // established binaryResult as the empty "[Binary]" array
    var num = number

    if num == 0 { // incase the number entered is zero just return the binary equivalent of 0
        return [Binary(digit: 0)]
    }

    while num > 0 {
        let remainder = num % 2 // gets the remainder when divided by two
        binaryResult.append(Binary(digit: remainder)) // appends the n'th remaineder to array
        num = num / 2 // continues by dividing it again and getting the next remainder
    }

    return binaryResult.reversed()
}
