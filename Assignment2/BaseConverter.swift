//
//  BaseConverter.swift
//  Assignment2
//
//  Created by Jack McCracken on 2015-02-26.
//  Copyright (c) 2015 Jack McCracken. All rights reserved.
//

import Foundation

class BaseConverter {
    // Maps base identifiers to lists of digits.
    let bases : [Character : [Character]] = [
        "b": ["0", "1"],
        "h": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"],
        "d": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    ];

    enum BaseConvertError {
        case INVALID_BASE
        case INVALID_CHAR
    }

    var error : BaseConvertError? = nil

    func fromBase(baseId : Character, numberStr : String) -> Int? {
        // The list of digits in this system
        let digits : [Character]? = bases[baseId]

        // Digits being nil means we got the wrong base specifier
        if digits == nil {
            error = BaseConvertError.INVALID_BASE
            return nil
        }

        var number = 0
        var power = 1
        
        let multiplier = digits!.count

        for c : Character in reverse(numberStr) {
            if let idx = find(digits!, c) {
                // power is the current power (ex 16^1, 16^2, etc)
                // idx is the current index into the digit array (conveniently the actual decimal
                // value of the digit in that position).
                number += power*idx
            }
            else {
                error = BaseConvertError.INVALID_CHAR
                return nil
            }

            power *= multiplier
        }

        return number
    }
}