//
//  SyntheticArrowSpineCalculator.swift
//  SpineCalculator
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

public struct SyntheticArrowSpineCalculator: SpineCalculator {
    
    public let commonCalculator: CommonSpineCalculator
    
    public init() {
        commonCalculator = CommonSpineCalculator(arrowLength: 28.0, drawLengthCompensation: 4.0)
    }
}
