//
//  Settings.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/29/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import Foundation

enum UnitTypes: Int {
    case km = 0
    case mi = 1
}

class UserSettings {
    static var unit: UnitTypes = UnitTypes.km {
        didSet {
            
        }
    }
    static var sounds: Bool = false
    
    private init() {}
}
