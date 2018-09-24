//
//  CommonCalculatorTests.swift
//  SpineCalculatorTests
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import XCTest
@testable import SpineCalculator

class CommonCalculatorTests: XCTestCase {
    
    var calc: CommonSpineCalculator!
    
    override func tearDown() {
        calc = nil
    }
    
    func testDrawWeightOnlyNoCompensation() {
        let arrowLength = 26.0
        let drawWeight = 20.0
        calc = CommonSpineCalculator(arrowLength: arrowLength, drawLengthCompensation: 0)
        let expected = 1300.0
        let actual = calc.calculate(drawWeight)
        XCTAssert(abs(expected - actual) < 0.001, "testDrawWeightOnlyNoCompensation")
    }
    
    func testDrawWeightOnlyWithCompensation() {
        let arrowLength = 26.0
        let drawWeight = 20.0
        calc = CommonSpineCalculator(arrowLength: arrowLength, drawLengthCompensation: 3)
        let expected = 1300.0
        let actual = calc.calculate(drawWeight)
        XCTAssert(abs(expected - actual) < 0.001, "testDrawWeightOnlyWithCompensation")
    }
    
    func testDrawWeightWithDrawLenghtNoCompensation() {
        let arrowLength = 26.0
        let drawLength = 30.0
        let drawWeight = 30.0
        let comp = 0.0
        calc = CommonSpineCalculator(arrowLength: arrowLength, drawLengthCompensation: comp)
        let expected = 866.666
        let actual = calc.calculate(drawWeight, drawLength: drawLength)
        XCTAssert(abs(expected - actual) < 0.001, "testDrawWeightWithDrawLenghtNoCompensation")
    }
    
    func testDrawWeightWithDrawLenghtWithCompensation() {
        let arrowLength = 26.0
        let drawLength = 30.0
        let drawWeight = 30.0
        let comp = 4.0
        calc = CommonSpineCalculator(arrowLength: arrowLength, drawLengthCompensation: comp)
        let expected = 684.21
        let actual = calc.calculate(drawWeight, drawLength: drawLength)
        XCTAssert(abs(expected - actual) < 0.001, "testDrawWeightWithDrawLenghtWithCompensation")
    }
}
