//
//  SyntheticArrowSpineCalculator.swift
//  SpineCalculator
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

struct SyntheticArrowSpineCalculator: SpineCalculator {
    
    let commonCalculator: CommonSpineCalculator
    
    init() {
        commonCalculator = CommonSpineCalculator(arrowLength: 28.0, drawLengthCompensation: 4.0)
    }
}
