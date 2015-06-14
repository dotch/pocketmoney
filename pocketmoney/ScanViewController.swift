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
import AFNetworking

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
        self.uploadImageToGini(imageData)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("scan view called!")
    }
    
    
    
    func uploadImageToGini(imageData: NSData) {
        let postURL = "https://api.gini.net/documents"
        let manager = AFHTTPRequestOperationManager()
        //let image: UIImage = info[UIImagePickerControllerEditedImage] as UIImage
        //let jpegImage = UIImageJPEGRepresentation(image, 0.5)
        println(imageData.length)
        manager.POST(postURL, parameters: nil,
            constructingBodyWithBlock: { (data: AFMultipartFormData!) in
                data.appendPartWithFileData(imageData, name: "file", fileName: "file.jpg", mimeType: "image/jpeg")
            },
            success: { operation, response in
                println("[success] operation: \(operation), response: \(response)")
            },
            failure: { operation, error in
                println("[fail] operation: \(operation), error: \(error)")
            }
        )
    }
}
