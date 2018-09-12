//
//  SpinerButton.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 12..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class SpinerButton: UIButton {

    func applyTheme(_ theme: Theme) {
        backgroundColor = theme.colors.tint
        titleLabel?.font = theme.fonts.buttonLarge
        titleLabel?.tintColor = theme.colors.backgroundLight
        
        layer.cornerRadius = bounds.size.height / 2.0
    }
}
