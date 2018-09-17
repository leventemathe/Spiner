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
        arrowVC.setSpine(String(spine))
    }
}
