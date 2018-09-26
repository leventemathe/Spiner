//
//  SpineCalculatorVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 26..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import SpineCalculator

protocol SpineCalculatorVC {

    var input: SpineInput! { get set }
    var calc: SpineCalculator! { get set }
}
