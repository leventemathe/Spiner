//
//  StatSelectorVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit

class StatSelectorVC: UIViewController {

    @IBOutlet weak var materialSelectorControl: UISegmentedControl!
    @IBOutlet weak var drawWeightTextField: UITextField!
    @IBOutlet weak var drawLengthTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!

    @IBAction func drawWeightTextFieldChanged(_ sender: UITextField) {
        enableDisableCalculateButton()
    }
    
    @IBAction func drawLengthTextFieldChanged(_ sender: UITextField) {
        enableDisableCalculateButton()
    }
    
    private func enableDisableCalculateButton() {
        if drawWeightTextField.text != nil && drawWeightTextField.text! != "" &&
            drawLengthTextField.text != nil && drawLengthTextField.text! != "" {
            calculateButton.isEnabled = true
        } else {
            calculateButton.isEnabled = false
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let drawWeight = Double(drawWeightTextField.text!)!
        let drawLength = Double(drawLengthTextField.text!)!
        let arrowMaterial = mapArrowMaterialString()
        let spineInput = SpineInput(drawWeight: drawWeight, drawLength: drawLength, arrowMaterial: arrowMaterial)
        print(spineInput)
    }
    
    private func mapArrowMaterialString() -> ArrowMaterial {
        if materialSelectorControl.selectedSegmentIndex == 0 {
            return .wooden
        }
        return .carbon
    }
    
    override func viewDidLoad() {
        calculateButton.isEnabled = false
        super.viewDidLoad()
    }
}

