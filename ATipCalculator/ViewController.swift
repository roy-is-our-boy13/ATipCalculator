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

class ViewController: UIViewController
{
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    let data = UIDevice.current.identifierForVendor?.uuidString

    override func viewDidLoad()
    {
        super.viewDidLoad()
        /* Do any additional setup after loading the view.
         Sets the title in the Navigation Bar
         */
        self.title = "Tip Calculator"
        
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Set a String value for some key.
        defaults.set("Hello World!", forKey: "myString")
        
        // Set an Integer value for some key.
        defaults.set(123, forKey: "myInt")
        
        // Set a Double value for some key.
        defaults.set(123.00, forKey: "myDouble")
        
        // Set a Bool value for some key.
        defaults.set(true, forKey: "myBool")
        
        // Set a Data value for some key.
        defaults.set(data, forKey: "currentUserData")
        
        // Force UserDefaults to save.
        defaults.synchronize()
        
        _ = UserDefaults.standard
        
        // Get a string value and provide a default string in the case the string is nil.
        _ = defaults.string(forKey: "myString") ?? "my default string"
        
        // Get an Integer value.
        _ = defaults.integer(forKey: "myInt")
        
        // Get a Double value.
        _ = defaults.double(forKey: "myDouble")
        
        // Get a Bool value.
        _ = defaults.bool(forKey: "myBool")
        
        // Get a Data value
        _ = defaults.data(forKey: "myData")
    }
    @IBAction func onTap(_ sender: Any)
    {
        print("Hello")
        
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any)
    {
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
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        print("view did appear")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        print("view did disappear")
    }
}
