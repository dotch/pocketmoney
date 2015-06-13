//
//  LoginViewController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import ParseUI
import Parse

class LoginViewController: PFLogInViewController {
    
    
    override func viewDidLoad() {
        println("View did load: loginviewController")
        super.viewDidLoad()
        delegate = self
        
    }
    
}

extension LoginViewController : PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        println("logged in!!")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension LoginViewController : PFSignUpViewControllerDelegate {
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        println("signed up!")
        dismissViewControllerAnimated(true, completion: nil)

    }
    
}
