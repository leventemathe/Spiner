//
//  DecimalOnlyTextField.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 09. 27..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class DecimalOnlyTextField: UITextField, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        let current = textField.text ?? ""
        let replacement = (current as NSString).replacingCharacters(in: range, with: string)
        return replacement.isDecmial
    }
}
