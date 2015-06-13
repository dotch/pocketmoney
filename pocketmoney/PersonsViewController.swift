//
//  ProfileController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation


class PersonsViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PersonsViewController: UITableViewDelegate {
    
}


/*extension PersonsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knownPeripherals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("peripheralCell") as! PeripheralTableViewCell
        
        let data = knownPeripherals[indexPath.row]
        
        cell.nameLabel.text = data.name
        cell.rssiLabel.text = "\(data.rssi)"
        cell.uuidLabel.text = data.uuid
        
        return cell
    }
}*/
