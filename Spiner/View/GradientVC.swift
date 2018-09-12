//
//  GradientVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 12..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class GradientVC: UIViewController {

    func applyThemeToSelf(_ theme: Theme) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [theme.colors.backgroundDark.cgColor, theme.colors.backgroundLight.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
