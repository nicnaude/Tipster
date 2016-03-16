//
//  ViewController.swift
//  TipCalc
//
//  Created by Nicholas Naudé on 11/03/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enterBillAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "Tip: $0.00"
        totalLabel.text = "Total: $0.00"
        
    }
    
    // MARK: Methods
    @IBAction func onEditingChanged(sender: AnyObject) {
 
        var billAmount: Double! = Double(billAmountTextField.text!)
        var tip = billAmount * 0.2
        var total = billAmount + tip
        
        tipLabel.text = "Tip: $\(tip)"
        totalLabel.text = "Total: $\(total)"
        
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

    }
    
    @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
    }

}

