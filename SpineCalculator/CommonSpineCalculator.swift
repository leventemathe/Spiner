//
//  CommonSpineCalculator.swift
//  SpineCalculator
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

/**
 A spine calculator that can be parametarised to calculate arrow spine for any standard (e.g. ATA or ASTM),
 that uses the method of measuring how much an arrow bends when a weight is applied to the center.
 */
public struct CommonSpineCalculator {
    
    /**
     The arrow length used when measuring how much the arrow bends. 26 for wooden (ATA), 28 for synthetic (ASTM).
     */
    public let arrowLength: Double
    
    /**
     If the draw lenght is longer/shorter then the arrowLenght, this compensation is added to or subtracted from the drawWeight for every inch.
     */
    public let drawLengthCompensation: Double
    
    /**
     - Parameters:
        - arrowLength: The arrow length used when measuring how much the arrow bends. 26 for wooden (ATA), 28 for synthetic (ASTM).
        - drawLengthCompensation: If the draw length is longer/shorter then 28, this compensation is added to or subtracted from the drawWeight for every inch.
     */
    public init(arrowLength: Double, drawLengthCompensation: Double) {
        self.arrowLength = arrowLength
        self.drawLengthCompensation = drawLengthCompensation
    }
    
    /**
     This method is for  calculating the spine for a draw length that matches 28 inches.
     */
    public func calculate(_ drawWeight: Double) -> Double {
        return (arrowLength / drawWeight) * 1000.0
    }
    
    /**
     This method is for calculating the spine for a draw length that differs from 28 inches
     */
    public func calculate(_ drawWeight: Double, drawLength: Double) -> Double {
        var diff = abs(drawLength - 28.0) * drawLengthCompensation
        diff *= drawLength < 28.0 ? -1 : 1
        return calculate(drawWeight + diff)
    }
}
