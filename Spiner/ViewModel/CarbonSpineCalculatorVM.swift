//
//  CarbonSpineCalculatorVM.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 26..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import Foundation

class CarbonSpineCalculatorVM {
    
    func calculateSpineWithExtra(_ spine: Double) -> (String, String) {
        let spine: Int = Int(round(spine))
        let remainder = spine % 100
        var resultSpine = spine - remainder
        
        if remainder > 50 {
            resultSpine += 100
            return (String(resultSpine), "With heavier point or longer shaft")
        } else if remainder == 0{
            return (String(resultSpine), "")
        } else {
            return (String(resultSpine), "With lighter point")
        }
    }
}
