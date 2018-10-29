//
//  Settings.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/29/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import Foundation

enum UnitTypes {
    case km
    case mi
}

class UserSettings {
    static var unit: UnitTypes = UnitTypes.km{
        didSet {
            
        }
    }
    static var sounds: Bool = true
    private init() {}
}
