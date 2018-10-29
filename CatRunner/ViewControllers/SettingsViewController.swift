//
//  SettingsViewController.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/28/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var unitSegments: UISegmentedControl!
    @IBOutlet weak var soundsSwitch: UISwitch!
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserSettings.unit == UnitTypes.km {
            unitSegments.selectedSegmentIndex = 0
        } else {
            unitSegments.selectedSegmentIndex = 1
        }
        
        if UserSettings.sounds {
            soundsSwitch.isOn = true
        } else {
            soundsSwitch.isOn = false
        }
        
    }
    
    @IBAction func unitDidChanged(_ sender: UISegmentedControl, forEvent event: UIEvent) {
        UserSettings.unit = UnitTypes(rawValue: sender.selectedSegmentIndex)!
    }
    
    @IBAction func soundsDidChanged(_ sender: UISwitch, forEvent event: UIEvent) {
        UserSettings.sounds = sender.isOn
    }
    
    
    
}
