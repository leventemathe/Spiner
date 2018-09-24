//
//  SyntheticArrowSpineCalculatorTests.swift
//  SpineCalculatorTests
//
//  Created by Máthé Levente on 2018. 09. 21..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import XCTest
@testable import SpineCalculator

class SyntheticArrowSpineCalculatorTests: XCTestCase {
    
    var calc: SpineCalculator = SyntheticArrowSpineCalculator()
    
    func testSpineCalculator() {
        let expected = 1400.0
        let actual = calc.calculate(20)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculator")
    }
    
    func testSpineCalculatorAtRegularDrawLength() {
        let expected = 1400.0
        let actual = calc.calculate(20.0, drawLength: 28.0)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculator")
    }
    
    func testSpineCalculatorLongerDrawLength() {
        let expected = 1000.0
        let actual = calc.calculate(20, drawLength: 30)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculatorLongerDrawLength")
    }
    
    func testSpineCalculatorShorterDrawLength() {
        let expected = 1555.555
        let actual = calc.calculate(30, drawLength: 25)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculatorShorterDrawLength")
    }
}
