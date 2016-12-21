//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Chandler Griffin on 12/19/16.
//  Copyright © 2016 Chandler Griffin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var TipSelector: UISegmentedControl!
    @IBOutlet weak var SwitchColor: UISwitch!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        
        self.splitSlider.value = Float(defaults.doubleForKey("doubleKey")) ?? 1
        splitLabel.text = String(format: "%.f", splitSlider.value)
        TipSelector.selectedSegmentIndex = defaults.integerForKey("index")
        SwitchColor.on = defaults.boolForKey("color")
    }
    
    @IBAction func splitCheck(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let splitNum = Double(roundf(splitSlider.value))
        
        defaults.setDouble(splitNum, forKey: "doubleKey")
        defaults.setInteger(TipSelector.selectedSegmentIndex, forKey: "index")
    defaults.setBool(SwitchColor.on, forKey: "color")
        defaults.synchronize()
    
        splitLabel.text = String(format: "%.f", splitNum)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
