//
//  WoodenArrowVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 15..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit
import SpineCalculator

class WoodenArrowVC: UIViewController, SpineCalculatorVC {

    var input: SpineInput!
    var calc: SpineCalculator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapModelToUI()
    }
    
    func mapModelToUI() {
        let spine = (calc as! WoodenArrowSpineCalculator).calculateAsPundage(input.drawWeight, drawLength: input.drawLength)
        let arrowVC = children.first! as! ArrowVC
        arrowVC.setTitle("Wooden Arrow")
        arrowVC.setSpine("\(Int(round(spine))) lbs")
        arrowVC.setExtra("")
        arrowVC.setStats(getBowStats())
    }
}
