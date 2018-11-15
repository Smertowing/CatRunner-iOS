//
//  HistoryViewController.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/28/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  UserHistory.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryViewCell") as! HistoryViewCell
        let historyItem = UserHistory.items[indexPath.row]
        cell.historyItem = historyItem
        return cell
    }

}
