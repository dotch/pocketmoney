//
//  FriendsListController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import ParseUI
import Parse


class FriendsListController: PFQueryTableViewController {
    
    var mode:String?
    var amount:String?
    
    @IBOutlet weak var titleBar: UINavigationItem!
    
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        // Configure the PFQueryTableView
        self.parseClassName = "_User"
        self.textKey = "username"
        self.pullToRefreshEnabled = false
        self.paginationEnabled = false
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var rowObj:PFUser = self.objectAtIndexPath(indexPath) as! PFUser
        println("selected something: \(rowObj.username)")
        
        let alertController = UIAlertController(title: "Confirm?", message:
            "Do you really want to \(mode!) \(amount!) to \(rowObj.username!)?", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {action in
            println("cancel was tapped")
            }))
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: {action in
            self.sendMoney(rowObj)
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("mode: \(mode!) , amount: \(amount!)")
        if(mode != nil) {
            titleBar.title = mode
        }
        
    }
    
    func sendMoney(user: PFUser) {
        println("confirm was tapped")
        //TODO make api call!
        var transaction = PFObject(className: "Transaction")
        if mode == "ask" {
            transaction["receivingUserId"] = PFUser.currentUser()
            transaction["sendingUserId"] = user
            transaction["status"] = "pending"
            transaction["mode"] = "ask"
        }else {
            transaction["receivingUserId"] = user
            transaction["sendingUserId"] = PFUser.currentUser()
            transaction["status"] = "done"
            transaction["mode"] = "get"
        }
        transaction["amount"] = amount
        transaction.save()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}