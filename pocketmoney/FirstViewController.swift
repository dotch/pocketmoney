//
//  FirstViewController.swift
//  pocketmoney
//
//  Created by cweiss on 13/06/15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FirstViewController: UIViewController {

    @IBOutlet weak var amount: UITextField!
    
    @IBAction func askButton(sender: AnyObject) {
        performSegueWithIdentifier("showFriendsList", sender: "ask")
    }
    
    @IBAction func sendButton(sender: AnyObject) {
        performSegueWithIdentifier("showFriendsList", sender: "send")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showFriendsList") {
            let controller = segue.destinationViewController as! FriendsListController
            controller.amount = self.amount.text
            if(sender as! String  == "ask") {
                controller.mode = "ask"
            }else {
                //send
                controller.mode = "send"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

