//
//  SpineCalculator.swift
//  SpineCalculator
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

/**
 Implement this protocol to create specific spine calculators, like for wooden or carbon arrows.
 */
public protocol SpineCalculator {
    
    /**
     Calculates the common cases.
     */
    var commonCalculator: CommonSpineCalculator { get }
    
    func calculate(_ drawWeight: Double) -> Double
    func calculate(_ drawWeight: Double, drawLength: Double) -> Double
}

extension SpineCalculator {
    
    /**
     A default implementation to calculate arrow spine at the standard's arrow length.
     */
    public func calculate(_ drawWeight: Double) -> Double {
        return commonCalculator.calculate(drawWeight)
    }
    
    /**
     A default implementation to calculate arrow spine at a draw length that's different from the standard's arrow length.
     */
    public func calculate(_ drawWeight: Double, drawLength: Double) -> Double {
        return commonCalculator.calculate(drawWeight, drawLength: drawLength)
    }
}
