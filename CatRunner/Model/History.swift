//
//  History.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/28/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import UIKit

class HistoryItem {
    
    private let oneKMtoMI = 1.609344
    
    var image: UIImage
    var kilometers: Double
    var miles: Double
    var time: Double
    
    init(km: Double, time: Double) {
        self.image = #imageLiteral(resourceName: "MapDefault")
        self.kilometers = km
        self.miles = km*oneKMtoMI
        self.time = time
    }
    
    init(image: UIImage, km: Double, time: Double) {
        self.image = image
        self.kilometers = km    
        self.miles = km*oneKMtoMI
        self.time = time
    }
}

class UserHistory: NSObject {
    
    static var items: [HistoryItem] = [HistoryItem(km: 0, time: 0)]

}
