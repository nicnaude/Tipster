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
    @IBOutlet weak var tableView: UITableView!
    
    var customersArray = []
    var customer1 = "$0.00"
    var customer2 = "$0.00"
    var customer3 = "$0.00"
    var customer4 = "$0.00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.barTintColor = UIColor.tipsterDarkGreen()
        
        tipLabel.text = "Tip: $0.00"
        totalLabel.text = "Total: $0.00"
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        tipControl.alpha = 0
        tableView.alpha = 0
        
        customersArray = ["One person: \(customer1)","Two people: \(customer2)","Three people: \(customer3)","Four people: \(customer4)"]
    }
    
    // MARK: Methods
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if (billAmountTextField.text == "") {
            tipLabel.text = "Tip: $0.00"
            totalLabel.text = "Total: $0.00"
            tipLabel.alpha = 0
            totalLabel.alpha = 0
            tipControl.alpha = 0
            tableView.alpha = 0
            
        } else {
            
            var tipPercentages = [0.18, 0.2, 0.22]
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            let billAmount: Double! = Double(billAmountTextField.text!)
            let tip = round (( billAmount! * tipPercentage ) * 100) / 100
            let total = round (( billAmount! + tip ) * 100) / 100
            
            
            totalLabel.text = "Total: $\(total)"
            self.tipLabel.text = "Tip: $\(tip)"
            
            customer1 = "$\(total)"
            customer2 = "$\(total / 2)"
            customer3 = "$\(total / 3)"
            customer4 = "$\(total / 4)"
            
            tipLabel.fadeIn(0.2, delay: 0.2, completion: { (Bool) -> Void in
                return
            })
            totalLabel.fadeIn(0.3, delay: 0.3, completion: { (Bool) -> Void in
                return
            })
            tipControl.fadeIn(0.4, delay: 0.4, completion: { (Bool) -> Void in
                return
            })
            tableView.fadeIn(0.4, delay: 0.4, completion: { (Bool) -> Void in
                return
            })
        }
        self.tableView.reloadData()
    }
    
    @IBAction func segmentedControl(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.tableView.reloadData()
        case 1:
            self.tableView.reloadData()
        default:
            break
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // MARK: TableView functions
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell!.textLabel?.text = customersArray[indexPath.row] as? String
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customersArray.count
    }
}

