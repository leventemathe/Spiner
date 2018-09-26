//
//  CarbonSpineCalculatorVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 15..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit
import SpineCalculator

class CarbonSpineCalculatorVC: UIViewController, SpineCalculatorVC {

    var input: SpineInput!
    var calc: SpineCalculator!
    
    var vm: CarbonSpineCalculatorVM! = CarbonSpineCalculatorVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapModelToUI()
    }
    
    private func mapModelToUI() {
        let spine = calc.calculate(input.drawWeight, drawLength: input.drawLength)
        let arrowVC = children.first! as! ArrowVC
        let spineWithExtra = vm.calculateSpineWithExtra(spine)
        print("Spine: \(spine)")
        print("Spine with extra \(spineWithExtra)")
        arrowVC.setSpine(spineWithExtra.0)
        arrowVC.setExtra(spineWithExtra.1)
        arrowVC.setStats(getBowStats())
    }
}
