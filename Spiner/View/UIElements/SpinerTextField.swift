//
//  SpinerTextField.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 31..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class SpinerTextField: DecimalOnlyTextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        borderStyle = .none
    }
    
    private var theme: Theme = DefaultTheme()
    private let placeholderBottomMargin: CGFloat = 8.0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX, y: bounds.minY, width: bounds.size.width, height: bounds.size.height - placeholderBottomMargin)
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let start = CGPoint(x: rect.minX, y: rect.maxY)
        let end = CGPoint(x: rect.maxX, y: rect.maxY)
        let path = UIBezierPath()
        
        path.move(to: start)
        path.addLine(to: end)
        path.lineWidth = 2.0
        theme.colors.tint.setStroke()
        
        path.stroke()
    }
    
    func applyTheme(_ theme: Theme, withPlaceholderText placeholder: String) {
        self.theme = theme
        let attr = [
            NSAttributedString.Key.foregroundColor: theme.colors.tint,
            NSAttributedString.Key.font: theme.fonts.text
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
        
        textColor = theme.colors.tint
    }
}
