//
//  SpineConverter.swift
//  SpineCalculator
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

struct SpineConverter {
    
    func convertToSynthetic(_ woodenSpine: Double) -> Double {
        return woodenSpine / 0.825
    }
    
    func convertToWooden(_ syntheticSpine: Double) -> Double {
        return syntheticSpine * 0.825
    }
}
