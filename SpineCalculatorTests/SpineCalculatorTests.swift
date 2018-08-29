//
//  SpineCalculatorTests.swift
//  SpineCalculatorTests
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import XCTest
@testable import SpineCalculator

class TestSpineCalculator: SpineCalculator {
    
    let commonCalculator = CommonSpineCalculator(arrowLength: 26, drawLengthCompensation: 4)
}

class SpineCalculatorTests: XCTestCase {
    
    func testSpineCalculator() {
        let calc = TestSpineCalculator()
        let expected = 1300.0
        let actual = calc.calculate(20)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculator")
    }
    
    func testSpineCalculatorLongerDrawLength() {
        let calc = TestSpineCalculator()
        let expected = (26.0 / (20.0 + 4.0*2.0)) * 1000.0
        let actual = calc.calculate(20, drawLength: 28)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculatorLongerDrawLength")
    }
    
    func testSpineCalculatorShorterDrawLength() {
        let calc = TestSpineCalculator()
        let expected = (26.0 / (20.0 - 4.0*3.0)) * 1000.0
        let actual = calc.calculate(20, drawLength: 23)
        XCTAssert(abs(expected - actual) < 0.001, "testSpineCalculatorShorterDrawLength")
    }
}
