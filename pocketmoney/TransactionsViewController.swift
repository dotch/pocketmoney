//
//  SecondViewController.swift
//  pocketmoney
//
//  Created by cweiss on 13/06/15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TransactionsViewController: PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("in transactions!")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Transaction"
        self.pullToRefreshEnabled = false
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        
        var sending = PFQuery(className: "Transaction")
        sending.whereKey("sendingUserId", equalTo: PFUser.currentUser()!)
        var receiving = PFQuery(className: "Transaction")
        receiving.whereKey("receivingUserId", equalTo: PFUser.currentUser()!)
        
        var query = PFQuery.orQueryWithSubqueries([sending, receiving])
        println("queryfortable!")
        query.includeKey("receivingUserId")
        query.includeKey("sendingUserId")
        //query.whereKey("receivingUserId", equalTo: PFUser.currentUser()!)
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        var cell = tableView.dequeueReusableCellWithIdentifier("transactionCell") as! TransactionCellView
        
        //println(cell.amount)
        
        
        var receivingUser = object?.objectForKey("receivingUserId") as! PFUser
        var sendingUser = object?.objectForKey("sendingUserId") as! PFUser
        
        var amount = object?.objectForKey("amount") as! String
        
        //println("send: \(sendingUser.username!)")
        //println("receive: \(receivingUser.username!)")
        
        // text
        //cell.username.text = "None"
        var u = receivingUser.objectId == PFUser.currentUser()?.objectId ? sendingUser.username! : receivingUser.username!
        println("UUU: \(u)");
        var textToShow = "\(amount) to \(u) "
        
        cell.username.text = textToShow
        cell.amount.text = "PAID"
        let rawUrl = receivingUser.objectForKey("imageUrl")
        if rawUrl != nil {
            let url = NSURL(string: rawUrl as! String)
            let data = NSData(contentsOfURL: url!)
            cell.userImage.image = UIImage(data: data!)

        }
        return cell
    }



}

