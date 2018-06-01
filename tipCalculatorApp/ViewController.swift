//
//  ViewController.swift
//  tipCalculatorApp
//
//  Created by Celal Aslan on 2018-06-01.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet var billAmountTextField: UITextField!
    
    @IBOutlet var calculateTipButton: UIButton!
    
    @IBAction func calculateTipAction(_ sender: UIButton) {
    }
    
    @IBOutlet var tipAmountLabel: UILabel!
    
    
    @IBOutlet var tipPercentageTextField: UITextField!
    
    
    
    
    
    
    var billAmount: Int = 0
    
    func calculateTip() -> String {
        let tipPercentage = (billAmount / 100) * 15
        return " $\(tipPercentage)"
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

