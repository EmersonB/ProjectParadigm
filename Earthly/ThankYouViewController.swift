//
//  ThankYouViewController.swift
//  Earthly
//
//  Created by Srinidhi Krishnamurthy on 5/1/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import Foundation
//pop back to rootVC

import UIKit

class ThankYouViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Rewards"
        //call the rewards dictionary and display it
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

