//
//  InitialTabbarController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import Parse

class InitialTabbarController: UITabBarController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //PFUser.logOut()
        let currentUser = PFUser.currentUser()
        if(currentUser == nil){
            performSegueWithIdentifier("showLogin", sender: self)
        }
        
        var backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)

    }
}
