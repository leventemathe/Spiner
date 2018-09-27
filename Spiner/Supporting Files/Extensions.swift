//
//  Extensions.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 31..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: UInt, g: UInt, b: UInt, a: CGFloat) {
        assert(r < 256, "UIColor extension: Invalid red component")
        assert(g < 256, "UIColor extension: Invalid green component")
        assert(b < 256, "UIColor extension: Invalid blue component")
        assert(a >= 0.0 && a <= 1.0, "UIColor extension: Invalid alpha component")
        self.init(red: CGFloat(r) / 250.0, green: CGFloat(g) / 250.0, blue: CGFloat(b) / 250.0, alpha: a)
    }
    
    convenience init(r: UInt, g: UInt, b: UInt) {
        self.init(r: r, g: g, b: b, a: 1.0)
    }
    
    convenience init(hex: UInt) {
        self.init(
            r: (hex >> 16),
            g: (hex >> 8) & 0xFF,
            b: hex & 0xFF
        )
    }
}

private struct MyColorsContainer {
    
    static let myColors = DefaultColors()
}

extension UIColor {
    
    static var myColors: DefaultColors {
        return MyColorsContainer.myColors
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension String {
    
    var isDecmial: Bool {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        formatter.locale = Locale.current
        return formatter.number(from: self) != nil
    }
}

extension Double {

    func rounded(_ decimals: UInt) -> Double {
        var decimals = decimals
        if decimals > 10 {
            decimals = 10
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.roundingMode = NumberFormatter.RoundingMode.halfUp
        formatter.maximumFractionDigits = Int(decimals)
        return Double(formatter.string(from: NSNumber(floatLiteral: self))!)!
    }
}
