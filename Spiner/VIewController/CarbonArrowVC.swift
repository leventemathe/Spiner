//
//  CarbonArrowVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 15..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit
import SpineCalculator

class CarbonArrowVC: UIViewController {
    
    var input: SpineInput!
    var calc: SpineCalculator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spine = calc.calculate(input.drawWeight, drawLength: input.drawLength)
        let arrowVC = children.first! as! ArrowVC
        let spineWithExtra = calculateSpineWithExtra(spine)
        print("Spine: \(spine)")
        print("Spine with extra \(spineWithExtra)")
        arrowVC.setSpine(spineWithExtra.0)
        arrowVC.setExtra(spineWithExtra.1)
        arrowVC.setStats(getBowStats())
    }
    
    private func calculateSpineWithExtra(_ spine: Double) -> (String, String) {
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
    
    private func getBowStats() -> String {
        return "\(input.drawWeight)# @ \(input.drawLength)\""
    }
}
