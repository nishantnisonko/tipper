//
//  ViewController.swift
//  Test2
//
//  Created by Nishanko, Nishant on 3/19/17.
//  Copyright © 2017 Nishanko, Nishant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
   
    let tipPercentages = [0.18,0.2,0.25]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);

    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        print(sender.tag)
        let bill = Double(billField.text!) ?? 0.0
        var tipPercentage = 0.0;
        var tip = 0.0;
        if(sender.tag == 1){
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            tip = Double(bill) * Double(tipPercentage)
            tipSlider.setValue(Float(tipPercentage*100), animated: true)
        }else{
            tipPercentage = Double(tipSlider.value.rounded()) * 0.01
            tip = bill * tipPercentage
            let i = tipPercentages.index(of: tipPercentage)
            if ((i) != nil){
                tipControl.selectedSegmentIndex = i!
            } else {
                tipControl.selectedSegmentIndex = -1
            }
            print(i ?? -2)
        }
        
        let total = bill+tip
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
        tipPercentageLabel.text=String(format: "%.0f", tipPercentage * 100) + "%"
        print(tip, total, tipPercentage)
        
    }
    
    
    func viewDidLoad(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "default_percentage_index")
        print(defaultIndex)
        var tipPercentage = 0.0;
        
        tipPercentage = tipPercentages[defaultIndex]
        
        tipControl.selectedSegmentIndex = defaultIndex
        
        tipSlider.setValue(Float(tipPercentage*100), animated: true)
       
        tipPercentageLabel.text=String(format: "%.0f", tipPercentage * 100) + "%"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "default_percentage_index")
        print(defaultIndex)
        var tipPercentage = 0.0;
        
        tipPercentage = tipPercentages[defaultIndex]
        
        tipControl.selectedSegmentIndex = defaultIndex
        
        tipSlider.setValue(Float(tipPercentage*100), animated: true)
        
        tipPercentageLabel.text=String(format: "%.0f", tipPercentage * 100) + "%"

        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

