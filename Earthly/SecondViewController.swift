//
//  SecondViewController.swift
//  Earthly
//
//  Created by Emery Berlik on 4/29/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var analysisLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //call the rewards dictionary and display it
        // Do any additional setup after loading the view, typically from a nib.
//        currentVerifiedLabel.text = "Current Verified Rewards: $" + String(currentUserVerifiedReward)
//        currentUnverifiedLabel.text = "Current Unverified Rewards: " + String(format: "$%.02f", locale: Locale.current, arguments: [currentUserReward])

        let current_credits = UserDefaults.standard.object(forKey: "credits") as? Int
        if let temp = current_credits{
            let exchange = String(format: "$%.02f", locale: Locale.current, arguments: [Double(temp) * 0.1])
            analysisLabel.text = "You have \(temp) credits \n This translates to \(exchange)"
        }
        else{
            analysisLabel.text = "You have no credits. Recycle more to earn some!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

