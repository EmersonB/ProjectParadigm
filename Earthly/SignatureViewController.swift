//
//  SignatureViewController.swift
//  Earthly
//
//  Created by Srinidhi Krishnamurthy on 5/1/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import Foundation
// add a bogus signature pad
// https://github.com/ipraba/EPSignature
// looks nice and works with CocoaPods

import UIKit
import EPSignature

class SignatureViewController: UIViewController, EPSignatureDelegate {
    @IBOutlet weak var imgViewSignature: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.topItem?.title = "Verification"
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onTouchSignatureButton(sender: AnyObject) {
        let signatureVC = EPSignatureViewController(signatureDelegate: self, showsDate: true, showsSaveSignatureOption: true)
        
        signatureVC.subtitleText = "I agree to the terms and conditions"
        signatureVC.title = "Signature"
        let nav = UINavigationController(rootViewController: signatureVC)
        present(nav, animated: true, completion: nil)
    }
    
    func epSignature(_: EPSignatureViewController, didCancel error : NSError) {
        print("User canceled")
    }
    
    func epSignature(_: EPSignatureViewController, didSign signatureImage : UIImage, boundingRect: CGRect) {
        print(signatureImage)
        imgViewSignature.image = signatureImage
    }
    
    @IBAction func submitOnTouch(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "Your credits will be redeemed after being reviewed", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.destructive, handler: { action in
            
            let current_credits = UserDefaults.standard.object(forKey: "credits") as? Int
            let items = UserDefaults.standard.object(forKey: "items") as? [String]
            
            if let temp = current_credits{
                let credits = temp
                if let temp2 = items{
                    UserDefaults.standard.set(temp2.count + credits, forKey: "credits")
                    UserDefaults.standard.set([], forKey: "items")
                }
            }
            if let temp2 = items{
                UserDefaults.standard.set(temp2.count, forKey: "credits")
            }
            
            self.close()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func close(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
