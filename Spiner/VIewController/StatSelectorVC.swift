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

    @IBOutlet weak var stackViewCenterYConstraint: NSLayoutConstraint!
    private let stackViewCenterYConstraintMovement: CGFloat = 180.0
    
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
        pushVCAccordingToUIState()
    }
    
    private func pushVCAccordingToUIState() {
        let drawWeight = Double(drawWeightTextField.text!)!.rounded(2)
        let drawLength = Double(drawLengthTextField.text!)!.rounded(2)
        let arrowMaterial = mapSegmentedControlToArrowMaterial()
        let spineInput = SpineInput(drawWeight: drawWeight, drawLength: drawLength, arrowMaterial: arrowMaterial)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var spineVC: SpineCalculatorVC
        switch arrowMaterial {
        case .carbon:
            spineVC = storyboard.instantiateViewController(withIdentifier: "CarbonArrowVC") as! CarbonSpineCalculatorVC
            spineVC.calc = SyntheticArrowSpineCalculator()
        case .wooden:
            spineVC = storyboard.instantiateViewController(withIdentifier: "WoodenArrowVC") as! WoodenArrowVC
            spineVC.calc = WoodenArrowSpineCalculator()
        }
        spineVC.input = spineInput
        navigationController?.pushViewController(spineVC as! UIViewController, animated: true)
    }
    
    private func mapSegmentedControlToArrowMaterial() -> ArrowMaterial {
        if materialSelectorControl.selectedSegmentIndex == 0 {
            return .wooden
        }
        return .carbon
    }
    
    override func viewDidLoad() {
        observeKeyboard()
        hideKeyboardWhenTappedAround()
        calculateButton.isEnabled = false
        applyTheme()
        super.viewDidLoad()
    }
    
    private func observeKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil);
    }
    
    @objc private func keyboardDidShow() {
        UIView.animate(withDuration: 0.3, animations: {
            self.stackViewCenterYConstraint.constant -= self.stackViewCenterYConstraintMovement
            self.view.layoutIfNeeded()
        })
    }
    
    @objc private func keyboardDidHide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.stackViewCenterYConstraint.constant = 0.0
            self.view.layoutIfNeeded()
        })
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

