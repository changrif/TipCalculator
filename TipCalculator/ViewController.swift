//
//  ViewController.swift
//  TipCalculator
//
//  Created by Chandler Griffin on 12/18/16.
//  Copyright © 2016 Chandler Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var numView: UIView!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipSelector: UISegmentedControl!
    @IBOutlet weak var MoneyField: UITextField!
    @IBOutlet weak var TopMoneyField: UITextField!
    @IBOutlet weak var split: UILabel!
    var greenBackground = UIColor(red: 0.87, green: 1, blue: 0.87, alpha: 1)
    var darkBackground = UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)
    var index = 0
    var splitNum = Double(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.numView.alpha = 0
        self.TopMoneyField.alpha = 0
        [MoneyField .becomeFirstResponder()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        splitNum = NSUserDefaults.standardUserDefaults().doubleForKey("doubleKey")
        index = NSUserDefaults.standardUserDefaults().integerForKey("index")
        
        let color = NSUserDefaults.standardUserDefaults().boolForKey("color")
        
        if(color)   {
            self.mainView.backgroundColor = greenBackground
            self.numView.backgroundColor = darkBackground
            self.TipSelector.tintColor = greenBackground
            self.TopMoneyField.textColor = UIColor.lightGrayColor()
            self.MoneyField.textColor = UIColor.lightGrayColor()
        }   else    {
            self.mainView.backgroundColor = darkBackground
            self.numView.backgroundColor = greenBackground
            self.TipSelector.tintColor = darkBackground
            self.TopMoneyField.textColor = greenBackground
            self.MoneyField.textColor = greenBackground
        }
        TipSelector.selectedSegmentIndex = index
        split.text = String(format: "%.f", splitNum)
        calculateTip(split)
    }
    
    @IBAction func moneyFieldChanged(sender: AnyObject) {
        [TopMoneyField .becomeFirstResponder()]
        TopMoneyField.text = MoneyField.text
        calculateTip(TopMoneyField)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let totalCheck = Double(TopMoneyField.text!) ?? 0
        let bill = totalCheck/splitNum
        let tipPercentages = [0.15, 0.2, 0.25]
        
        let tipSelect = tipPercentages[TipSelector.selectedSegmentIndex]
        NSUserDefaults.standardUserDefaults().setInteger(TipSelector.selectedSegmentIndex, forKey: "index")
        
        let tip = bill * tipSelect
        let total  = bill + tip
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
        
        if(TopMoneyField.text != "")    {
            UIView.animateWithDuration(0.3, animations: {
                self.TopMoneyField.alpha = 1
                self.MoneyField.alpha = 0
                self.numView.alpha = 1
            })
        }   else    {
            MoneyField.text = ""
            [MoneyField .becomeFirstResponder()]
            UIView.animateWithDuration(0.3, animations: {
                self.TopMoneyField.alpha = 0
                self.MoneyField.alpha = 1
                self.numView.alpha = 0
            })
        }
    }
}

