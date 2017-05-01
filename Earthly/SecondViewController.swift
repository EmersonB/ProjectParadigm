//
//  SecondViewController.swift
//  Earthly
//
//  Created by Emery Berlik on 4/29/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var currentVerifiedLabel: UILabel!
    @IBOutlet weak var lastRequestedBoshal: UILabel!
    @IBOutlet weak var currentUnverifiedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Rewards"
        //call the rewards dictionary and display it
        // Do any additional setup after loading the view, typically from a nib.
        currentVerifiedLabel.text = "Current Verified Rewards: $" + String(currentUserVerifiedReward)
        currentUnverifiedLabel.text = "Current Unverified Rewards: " + String(format: "$%.02f", locale: Locale.current, arguments: [currentUserReward])

        lastRequestedBoshal.text = "Last Recycled Item: " + lastRequestedItem

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

