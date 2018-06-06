//
//  ViewController.swift
//  tipCalculatorApp
//
//  Created by Celal Aslan on 2018-06-01.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: Properties
    
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var calculateTipButton: UIButton!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var tipPercentageTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
//     private var billAmount = 0.0
     private var tipPercentage = 15
//     private var tipAmount = 0.0
    
    // MARK: Actions
    
    @IBAction func calculateTipAction(_ sender: UIButton) {
//        totalAmountLabel.text = calculateTip()
//        tipAmountLabel.text = "$ \(tipAmount)"
        calculateTip()
        hideKeyboard()
    }
    
    @IBAction func tipAmountSlided(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        tipPercentage = currentValue
        tipPercentageTextField.text = "% \(currentValue)"
//        totalAmountLabel.text = calculateTip()
//        tipAmountLabel.text = "$ \(tipAmount)"
        calculateTip()
        hideKeyboard()
    }
    
    @IBAction func billAmountChangedAction(_ sender: UITextField) {
        calculateTip()
    }
    
    @IBAction func tipAmountChangedAction(_ sender: UITextField) {
        if let tip = Int(tipPercentageTextField.text!) {
        tipPercentage = tip
            calculateTip()
            if (!tipPercentageTextField.isEditing) {
            tipPercentageTextField.text = "% \(tipPercentage)"
            }
        }else {
            tipAmountLabel.text = "Enter the tip amount"
            totalAmountLabel.text = "Please"
            }
    }

    
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
//        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Hide the keyboard for every field
    textField.resignFirstResponder()
        return true
    }
    
    // MARK: Methods
    
    func calculateTip() {
        var totalAmount: Double = 0.0
        if let billAmount = Double(billAmountTextField.text!) {
            let tipAmountDouble = (billAmount / 100) * Double(tipPercentage)
//            let roundedTipAmount = round(100 * tipAmount) / 100
            totalAmount = billAmount + tipAmountDouble
//            tipAmount = tipAmountDouble
            tipAmountLabel.text = "$ \(tipAmountDouble) "
            totalAmountLabel.text = "$ \(totalAmount)"
        }
        else {
            tipAmountLabel.text = "Enter the bill amount"
            totalAmountLabel.text = "Please"
        }
    }
    
//    func calculateTip() -> String {
//        var totalAmount: Double = 0.0
//        if let billAmount = Double(billAmountTextField.text!)  {
//        let tipAmountDouble = (billAmount / 100) * Double(tipPercentage)
//        let roundedCalculation =  round(100 * tipAmount) / 100
//        totalAmount = billAmount + roundedCalculation
//            tipAmount = tipAmountDouble
//     }
//        return "$ \(totalAmount)"
//    }
    
//    func adjustHeight(show: Bool, notification: NSNotification) {
//
//
//        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let changeHeight = (keyboardFrame.height + 40) * (show ? 1 : -1)
//
//        backgroundScrollView.contentInset.bottom += changeHeight
//        backgroundScrollView.scrollIndicatorInsets.bottom += changeHeight
//
//
//    }
//    @objc func keyboardWillShow(notification: NSNotification) {
//        adjustHeight(show: true, notification: notification)
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        adjustHeight(show: false, notification: notification)
//    }
    
    
    func hideKeyboard() {
        billAmountTextField.resignFirstResponder()
        tipPercentageTextField.resignFirstResponder()
    }
    
    //touch outside to finish the editing and dismiss the keyboard
    func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("handleTap method was called")
    view.endEditing(true)
    }

    
    
//    //keyboard status check
//    @objc func keyboardWillChange(notification: Notification) {
//        // keyboard up/ down
//        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//            //keyboard will push the content to up
//        }
//        if notification.name == Notification.Name.UIKeyboardWillShow ||
//            notification.name == Notification.Name.UIKeyboardWillChangeFrame {
//            view.frame.origin.y = -keyboardRect.height
//            //keyboard goes back
//        } else {
//            view.frame.origin.y = 0
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.delegate = self
        tipPercentageTextField.delegate = self
//        tipPercentageTextField.text = "% \(tipPercentage)"
        configureTapGesture()
        
        //listen for keyboard events
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    // stop listening keyboard hide/show events
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
//
//    }
}


