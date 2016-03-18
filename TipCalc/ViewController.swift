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
    
    @IBOutlet weak var customer1: UILabel!
    @IBOutlet weak var customer2: UILabel!
    @IBOutlet weak var customer3: UILabel!
    @IBOutlet weak var customer4: UILabel!
    @IBOutlet weak var totalLine: UIView!
    @IBOutlet weak var splitCover: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.layer.cornerRadius = 17
        tipControl.layer.borderWidth = 1.5
        tipControl.layer.borderColor = UIColor.tipsterDarkGreen().CGColor
        tipControl.layer.masksToBounds = true
        
        navigationController!.navigationBar.barTintColor = UIColor.tipsterDarkGreen()
        navigationController?.navigationBar.barStyle = UIBarStyle.Black
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        tipLabel.text = "Tip: $0.00"
        totalLabel.text = "Total: $0.00"
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        tipControl.alpha = 0
        totalLine.alpha = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        billAmountTextField.becomeFirstResponder()
    }
    
    // MARK: Methods
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if (billAmountTextField.text == "") {
            tipLabel.text = "Tip: $0.00"
            totalLabel.text = "Total: $0.00"
            tipLabel.alpha = 0
            totalLabel.alpha = 0
            tipControl.alpha = 0
            splitCover.alpha = 1
            totalLine.alpha = 0
            
        } else {
            
            let tip1Double: Double = 0.18
            let tip1Float: Float = Float(tip1Double)
            
            let tip2Double: Double = 0.2
            let tip2Float: Float = Float(tip2Double)
            
            let tip3Double: Double = 0.22
            let tip3Float: Float = Float(tip3Double)
            
            var tipPercentages = [tip1Float, tip2Float, tip3Float]
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            let billAmount: Float! = Float(billAmountTextField.text!)
            
            let tip = round (( billAmount! * tipPercentage ) * 100) / 100
            let total = round (( billAmount! + tip ) * 100) / 100
            
            self.tipLabel.text = String(format: "Tip: $%.02f", tip)
            totalLabel.text = String(format: "Total: $%.02f", total)
            
            customer1.text = String(format: "$%.02f", total)
            customer2.text = String(format: "$%.02f each", total/2)
            customer3.text = String(format: "$%.02f each", total/3)
            customer4.text = String(format: "$%.02f each", total/4)
            
            tipLabel.fadeIn(0.3, delay: 0.3, completion: { (Bool) -> Void in
                return
            })
            totalLabel.fadeIn(0.4, delay: 0.4, completion: { (Bool) -> Void in
                return
            })
            totalLine.fadeIn(0.4, delay: 0.4, completion: { (Bool) -> Void in
                return
            })
            tipControl.fadeIn(0.2, delay: 0.2, completion: { (Bool) -> Void in
                return
            })
            //            splitCover.alpha = 0
            splitCover.fadeOut(0.5, delay: 0.5, completion: { (Bool) -> Void in
                return
            })
            //            splitCover.fadeIn(0.0, delay: 0.0, completion: { (Bool) -> Void in
            //                return
            //            })
        }
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

