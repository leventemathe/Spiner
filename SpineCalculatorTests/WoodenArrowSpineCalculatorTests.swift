//
//  WoodenArrowSpineCalculatorTests.swift
//  SpineCalculatorTests
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import XCTest
@testable import SpineCalculator

class WoodenArrowSpineCalculatorTests: XCTestCase {
    
    var calc = WoodenArrowSpineCalculator()
    
    func testSpineAsPoundage() {
        let expected = 45.0
        let actual = calc.calculateAsPundage(35.0)
        XCTAssert(abs(expected - actual) < 0.001, "testSpine")
    }
    
    func testSpineAsPoundageWithLongerDrawLength() {
        let expected = 75.0
        let actual = calc.calculateAsPundage(35.0, drawLength: 32.0)
        print("expected: \(expected), actual: \(actual)")
        XCTAssert(abs(expected - actual) < 0.001, "testSpineAsPoundageWithLongerDrawLength")
    }
    
    func testSpineAsPoundageWithShorterDrawLength() {
        let expected = 40.0
        let actual = calc.calculateAsPundage(35.0, drawLength: 25.0)
        print("expected: \(expected), actual: \(actual)")
        XCTAssert(abs(expected - actual) < 0.001, "testSpineAsPoundageWithShorterDrawLength")
    }
}
