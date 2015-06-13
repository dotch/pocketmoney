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
    
    @IBAction func playRecord(sender: UIButton) {
    }
    
    @IBOutlet var amount: UILabel!
    
    @IBOutlet var username: UILabel!
    
    @IBOutlet var userImage: UIImageView!
}