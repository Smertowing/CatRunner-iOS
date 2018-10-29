//
//  HistoryViewCell.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/28/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import UIKit

class HistoryViewCell: UITableViewCell {

    @IBOutlet weak var historyImage: UIImageView!
    @IBOutlet weak var distanceUnit: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var time: UILabel!
    
    func update() {
        self.historyImage.image = historyItem?.image
        if UserSettings.unit == UnitTypes.km {
            distanceUnit.text = "km"
            distance.text = String(format:"%0.2f", historyItem?.kilometers ?? 0)
        } else {
            distanceUnit.text = "mi"
            distance.text = String(format:"%0.2f", historyItem?.miles ?? 0)
        }
        self.time.text = String(historyItem!.time)
    }
    
    var historyItem: HistoryItem? {
        didSet{
            self.update()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
