//
//  WoodenArrowSpineCalculator.swift
//  SpineCalculator
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

struct WoodenArrowSpineCalculator: SpineCalculator {
    
    let arrowLength = 26.0
    let commonCalculator: CommonSpineCalculator
    
    init() {
        commonCalculator = CommonSpineCalculator(arrowLength: self.arrowLength, drawLengthCompensation: 5.0)
    }
    
    /**
     Experienced archers like adding ~10 pounds to the pound version of arrow spine, this represents that.
     */
    let recommendedPoundageCompensation = 10.0
    
    func calculateAsPundage(_ drawWeight: Double) -> Double {
        return drawWeight + recommendedPoundageCompensation
    }
    
    func calculateAsPundage(_ drawWeight: Double, drawLength: Double) -> Double {
        var drawLengthDiff = commonCalculator.drawLengthCompensation * abs(drawLength - arrowLength)
        drawLengthDiff *= drawLength < arrowLength ? -1 : 1
        return calculateAsPundage(drawWeight) + drawLengthDiff
    }
}
