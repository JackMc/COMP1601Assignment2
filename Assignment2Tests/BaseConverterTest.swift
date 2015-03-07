//
//  BaseConverterTest.swift
//  Assignment2
//
//  Created by Jack McCracken on 2015-02-26.
//  Copyright (c) 2015 Jack McCracken. All rights reserved.
//

import XCTest

class BaseConverterTest: XCTestCase {
    let converter = BaseConverter()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFromBinary() {
        XCTAssert(converter.toDecimal("b", numberStr: "111") == 7)
        XCTAssert(converter.toDecimal("b", numberStr: "1010") == 10)
        XCTAssert(converter.toDecimal("b", numberStr: "11111111") == 255)
        XCTAssert(converter.toDecimal("b", numberStr: "10000000") == 128)
        // Check the failure case
        XCTAssert(converter.toDecimal("b", numberStr: "1ff00000") == nil && converter.error == BaseConverter.BaseConvertError.INVALID_CHAR)
    }

    func testFromHex() {
        XCTAssert(converter.toDecimal("h", numberStr: "ff") == 255)
        XCTAssert(converter.toDecimal("h", numberStr: "1ab") == 427)
        XCTAssert(converter.toDecimal("h", numberStr: "c") == 12)
        XCTAssert(converter.toDecimal("h", numberStr: "xff") == nil && converter.error == BaseConverter.BaseConvertError.INVALID_CHAR)
    }
    
    func testToHex() {
        var result : String? = converter.fromDecimal("h", num: 255)
        XCTAssert(result == "ff", String(result!))
        result = converter.fromDecimal("h", num: 427)
        XCTAssert(result == "1ab", String(result!))
        result = converter.fromDecimal("h", num: 12)
        XCTAssert(result == "c", String(result!))
    }
    
    func testToBinary() {
        var result : String? = converter.fromDecimal("b", num: 7)
        XCTAssert(result == "111", String(result!))
        result = converter.fromDecimal("b", num: 10)
        XCTAssert(result == "1010", String(result!))
        result = converter.fromDecimal("b", num: 255)
        XCTAssert(result == "11111111", String(result!))
        result = converter.fromDecimal("b", num: 128)
        XCTAssert(result == "10000000", String(result!))
    }
}
