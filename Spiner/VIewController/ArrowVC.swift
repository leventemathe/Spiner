//
//  ArrowVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 15..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class ArrowVC: GradientVC {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var spineLbl: UILabel!
    @IBOutlet weak var extraSpineLbl: UILabel!
    @IBOutlet weak var bowLbl: UILabel!
    @IBOutlet weak var statsLbl: UILabel!
    
    override func viewDidLoad() {
        applyThemeToSelf(theme)
    }
}
