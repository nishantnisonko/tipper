//
//  SettingsViewController.swift
//  Test2
//
//  Created by Nishanko, Nishant on 3/20/17.
//  Copyright © 2017 Nishanko, Nishant. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercentageControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func setDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultPercentageControl.selectedSegmentIndex, forKey: "default_percentage_index")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "default_percentage_index")
        print(defaultIndex)
        defaultPercentageControl.selectedSegmentIndex = defaultIndex
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
