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


class PersonsListViewController: PFQueryTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("initialize personlist")
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
        self.imageKey = "imageUrl"
        self.pullToRefreshEnabled = false
        self.paginationEnabled = false
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        var cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as! PFTableViewCell
        cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UserCell")
        
        // image
        let url = NSURL(string: object?.objectForKey("imageUrl") as! String)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        cell.imageView!.image = UIImage(data: data!)
        
        // text
        cell.textLabel!.text = object?.objectForKey("username") as! String
        return cell
    }
}
