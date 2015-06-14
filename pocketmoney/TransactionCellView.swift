//
//  TransactionCellView.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import ParseUI

class TransactionCellView: PFTableViewCell {
    
    @IBAction func setTransactionDone(sender: AnyObject) {
        println("setting item \(sender.tag) done...")
        //TODO make request to parse and set status to done
    }
    
    @IBOutlet weak var transactionDoneButton: UIButton!
    @IBOutlet weak var date: UILabel!
        
    @IBOutlet var username: UILabel!
    
    @IBOutlet var userImage: UIImageView!
}