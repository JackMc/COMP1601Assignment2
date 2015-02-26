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
        XCTAssert(converter.fromBase("b", numberStr: "111") == 7)
        XCTAssert(converter.fromBase("b", numberStr: "1010") == 10)
        XCTAssert(converter.fromBase("b", numberStr: "11111111") == 255)
        XCTAssert(converter.fromBase("b", numberStr: "10000000") == 128)
        // Check the failure case
        XCTAssert(converter.fromBase("b", numberStr: "1ff00000") == nil && converter.error == BaseConverter.BaseConvertError.INVALID_CHAR)
    }

    func testFromHex() {
        XCTAssert(converter.fromBase("h", numberStr: "ff") == 255)
        XCTAssert(converter.fromBase("h", numberStr: "1ab") == 427)
        XCTAssert(converter.fromBase("h", numberStr: "c") == 12)
        XCTAssert(converter.fromBase("h", numberStr: "xff") == nil && converter.error == BaseConverter.BaseConvertError.INVALID_CHAR)
    }
}
