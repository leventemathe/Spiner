//
//  SpinerButton.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 12..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class SpinerButton: UIButton, ThemeableView {

    func applyTheme(_ theme: Theme) {
        backgroundColor = theme.colors.tint
        titleLabel?.font = theme.fonts.buttonLarge
        setTitleColor(theme.colors.backgroundDark, for: .normal)
        setTitleColor(theme.colors.backgroundLight, for: .disabled)
        
        layer.cornerRadius = bounds.size.height / 2.0
    }
}
