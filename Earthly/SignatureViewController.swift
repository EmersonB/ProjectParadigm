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
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onTouchSignatureButton(sender: AnyObject) {
        let signatureVC = EPSignatureViewController(signatureDelegate: self, showsDate: true, showsSaveSignatureOption: true)
        
        signatureVC.subtitleText = "I agree to the terms and conditions"
        signatureVC.title = "Srinidhi Krishanmurthy"
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
    
}
