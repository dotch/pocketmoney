//
//  ProfileController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import Parse
import ParseUI


class PersonsViewController: UIViewController {

    @IBAction func buttonClicked(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentUser = PFUser.currentUser()
        username.text = currentUser?.username
        
        let rawUrl = currentUser!.objectForKey("imageUrl")
        if((rawUrl) != nil) {
            let url = NSURL(string: rawUrl as! String)
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            profilePic.image = UIImage(data: data!)
        }
        
    }
    
}

