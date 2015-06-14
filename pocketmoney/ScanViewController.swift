//
//  ScanViewController.swift
//  pocketmoney
//
//  Created by Maksim Antin on 13.06.15.
//  Copyright (c) 2015 pocketmoney. All rights reserved.
//

import Foundation
import Bolts

class ScanViewController: UIViewController, GiniVisionDelegate {
    
    @IBAction func scan(sender: AnyObject) {
        GiniVision.captureImageWithViewController(self, delegate: self)
    }
    @IBOutlet weak var amountToPay: UILabel!
    
    @IBOutlet weak var sliderObj: UISlider!
    
    @IBOutlet weak var askButton: UIButton!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var splitbyString: UILabel!
    
    @IBOutlet weak var amountString: UILabel!
    
    
    @IBAction func askButton(sender: AnyObject) {
        println("ask!")
        performSegueWithIdentifier("transactionAfterScan", sender: "ask")

    }
    @IBAction func sendButton(sender: AnyObject) {
        println("send!")
        performSegueWithIdentifier("transactionAfterScan", sender: "send")

    }
    
    @IBAction func personSliderChange(sender: UISlider) {
        var sliderValue: Int = Int(sender.value)
        println("change: \(sliderValue)")
        splitbyString.text = "Split by: \(sliderValue)"
        amountToPay.text = amountToPay.text
    }
    func didScan(document: UIImage!, documentType docType: GINIDocumentType, uploadDelegate delegate: GINIVisionUploadDelegate!) {
        println("scanned")
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let giniSdk = appDelegate.giniSdk
        
        var manager = giniSdk?.documentTaskManager
        
        giniSdk?.sessionManager.getSession().continueWithBlock({ (task: BFTask!) -> AnyObject! in
            if task.error != nil {
                print(task.error)
                return giniSdk?.sessionManager.logIn()
            }
            return task.result
        }).continueWithSuccessBlock({ (task: BFTask!) -> AnyObject! in
            return manager?.createDocumentWithFilename("scan", fromImage: document)
        }).continueWithSuccessBlock({ (task: BFTask!) -> AnyObject! in
            var document = task.result as! GINIDocument
            return document.extractions
        }).continueWithExecutor(BFExecutor.mainThreadExecutor(), withBlock: { (task: BFTask!) -> AnyObject! in
            println(task.result)
            var res = task.result as! Dictionary<String, GINIExtraction>
            self.showStuff()
            
            var priceExtr = res["amountToPay"]
            if let price = priceExtr?.value {
                print("price: \(price)")
                var index = advance(price.endIndex, -4)
                self.amountToPay.text = price.substringToIndex(index)
            }
            
            
            
            return nil
        }).continueWithBlock({ (task: BFTask!) -> AnyObject! in
            delegate.didEndUpload()
            return nil
        })
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "transactionAfterScan") {
            let controller = segue.destinationViewController as! FriendsListController
            controller.amount = self.amountToPay.text
            if(sender as! String  == "ask") {
                controller.mode = "ask"
            }else {
                //send
                controller.mode = "send"
            }
        }
    }
    
    func showStuff() {
        amountToPay.hidden = false
        sliderObj.hidden = false
        askButton.hidden = false
        sendButton.hidden = false
        amountString.hidden = false
        splitbyString.hidden = false
    }

}
