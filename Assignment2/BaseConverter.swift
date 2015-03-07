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
        "h": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"],
        "d": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    ];

    enum BaseConvertError {
        case INVALID_BASE
        case INVALID_CHAR
    }

    var error : BaseConvertError? = nil

    func toDecimal(baseId : Character, numberStr : String) -> Int? {
        // Get the list of digits in this number system
        if let digits : [Character] = bases[baseId] {
            let base : Int = digits.count

            var number : Int = 0
            var power : Int = 1

            for c : Character in reverse(numberStr) {
                if let idx = find(digits, c) {
                    // power is the current power (ex 16^1, 16^2, etc)
                    // idx is the current index into the digit array (conveniently the actual decimal
                    // value of the digit in that position).
                    number += power*idx
                }
                else {
                    error = BaseConvertError.INVALID_CHAR
                    return nil
                }

                power *= base
            }

            return number
        }
        // Digits being nil means we got the wrong base specifier
        else {
            error = BaseConvertError.INVALID_BASE
            return nil
        }
    }

    func fromDecimal(baseId: Character, num: Int) -> String? {
        if let digits : [Character] = bases[baseId] {
            let base : Int = digits.count
            var quotient : Int = num
            var numStr : String = ""
            
            // Algorithm is to keep dividing the number until we get zero
            // The remainders will give us the decimal values of the digits
            while quotient != 0 {
                let remains : Int = quotient % base
                // This will be a number between zero and "base-1". A valid index!
                //We convert the digit into a string because then we can append it!
                numStr += String(digits[remains])
                quotient /= base
            }
            
            // This algorithm gives the reverse of the digits
            return String(reverse(numStr))
        }
        else {
            error = BaseConvertError.INVALID_BASE
            return nil
        }
    }
}