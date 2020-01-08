//
//  ViewController.swift
//  ATipCalculator
//
// This is the program for all the buttons to functon. Controls the UI
//
//  Created by Roy Perlman on 12/30/19.
//  Copyright © 2019 Roy Perlman. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hellow")
        
        view.endEditing(true)
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get the bill amount.
        let bill = Double(billField.text!) ?? 0
        
        //Calculate the tip and total.
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[TipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        //Update thr tip and total labels.
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
    
}

