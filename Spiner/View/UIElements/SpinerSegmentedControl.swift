//
//  SpinerSegmentedControl.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 31..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class SpinerSegmentedControl: UISegmentedControl, ThemeableView {
    
    func applyTheme(_ theme: Theme) {
        tintColor = theme.colors.tint
        let attr = [NSAttributedString.Key.font: theme.fonts.text]
        setTitleTextAttributes(attr, for: .normal)
    }
}
