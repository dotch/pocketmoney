//
//  ScanViewController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UIAlertViewDelegate, UINavigationControllerDelegate {
    
    @IBAction func scan(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.allowsEditing = false
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        var imageToUse:UIImage = editingInfo[UIImagePickerControllerEditedImage] as! UIImage
        var imageData = UIImageJPEGRepresentation(imageToUse, 0.8)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("scan view called!")
    }
}
