//
//  StatSelectorVC.swift
//  Spiner
//
//  Created by Máthé Levente on 2018. 08. 29..
//  Copyright © 2018. Levente Máthé. All rights reserved.
//

import UIKit
import SpineCalculator

class StatSelectorVC: GradientVC {

    @IBOutlet weak var materialSelectorControl: SpinerSegmentedControl!
    @IBOutlet weak var drawWeightTextField: SpinerTextField!
    @IBOutlet weak var drawLengthTextField: SpinerTextField!
    @IBOutlet weak var calculateButton: SpinerButton!

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
    
    // TODO: Make sure only numbers can be typed in
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let drawWeight = Double(drawWeightTextField.text!)!
        let drawLength = Double(drawLengthTextField.text!)!
        let arrowMaterial = mapArrowMaterialString()
        let spineInput = SpineInput(drawWeight: drawWeight, drawLength: drawLength, arrowMaterial: arrowMaterial)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch arrowMaterial {
        case .carbon:
            let arrowVC = storyboard.instantiateViewController(withIdentifier: "CarbonArrowVC") as! CarbonArrowVC
            arrowVC.input = spineInput
            arrowVC.calc = SyntheticArrowSpineCalculator()
            navigationController?.pushViewController(arrowVC, animated: true)
        case .wooden:
            let arrowVC = storyboard.instantiateViewController(withIdentifier: "WoodenArrowVC") as! WoodenArrowVC
            navigationController?.pushViewController(arrowVC, animated: true)
        }
    }
    
    private func mapArrowMaterialString() -> ArrowMaterial {
        if materialSelectorControl.selectedSegmentIndex == 0 {
            return .wooden
        }
        return .carbon
    }
    
    override func viewDidLoad() {
        calculateButton.isEnabled = false
        applyTheme()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func applyTheme() {
        navigationController?.navigationBar.tintColor = theme.colors.tint
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        applyThemeToSelf(theme)
        materialSelectorControl.applyTheme(theme)
        drawLengthTextField.applyTheme(theme, withPlaceholderText: drawLengthTextField.placeholder!)
        drawWeightTextField.applyTheme(theme, withPlaceholderText: drawWeightTextField.placeholder!)
        calculateButton.applyTheme(theme)
    }
}

