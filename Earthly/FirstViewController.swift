//
//  FirstViewController.swift
//  Earthly
//
//  Created by Emery Berlik on 4/29/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import AVFoundation

var currentUserReward = 0.0
let timeBanInHours = 3
class FirstViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var endTim: Date!

    @IBOutlet weak var rewardButton: UIButton!
    @IBOutlet var recentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    let formatter = DateFormatter()
    let userCleander = Calendar.current;
    let requestedComponent : Set<Calendar.Component> = [
        Calendar.Component.month,
        Calendar.Component.day,
        Calendar.Component.hour,
        Calendar.Component.minute,
        Calendar.Component.second
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Scan Item"
        timeLabel.text = "Eligible for Reward"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let recent_item = UserDefaults.standard.object(forKey: "recent_item") as? String
        
        if let recent = recent_item {
            recentLabel.text = recent
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    func timeCalculator(dateFormat: String, endTime: Date, startTime: Date = Date()) -> DateComponents {
        formatter.dateFormat = dateFormat
        let _startTime = startTime
        
        let timeDifference = userCleander.dateComponents(requestedComponent, from: _startTime, to: endTime)
        return timeDifference
    }
    
    func timePrinter() -> Void {
        let time = timeCalculator(dateFormat: "MM/dd/yyyy hh:mm:ss a", endTime: endTim)
        timeLabel.text = "\(time.hour!) Hours \(time.minute!) Minutes \(time.second!) Seconds"
        rewardButton.isEnabled = false
        if(time.minute! == 0 && time.second! == 0){
            timeLabel.text = "Eligible for Reward"
            rewardButton.isEnabled = true
        }
    }
    
    func priceAlgorithm(firstNum: Double, secondNum: Double) -> Double{
        return Double(arc4random()) / Double(UINT32_MAX) * Double(abs(firstNum - secondNum)) + Double(min(firstNum, secondNum))
    }
    
    @IBAction func redeemButton(_ sender: Any) {
        if(recentLabel.text != "Press 'Scan Item' to Scan!"){
            // get the price
            let price = priceAlgorithm(firstNum: 0.6, secondNum: 1.8)
            timeLabel.isEnabled = true
            currentUserReward += price
            // start the timer
            endTim = Date().addingTimeInterval(TimeInterval(timeBanInHours * 60 * 60))
            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timePrinter), userInfo: nil, repeats: true)
            timer.fire()
            print(currentUserReward)
            // update rewards dictionary
        }
    }

}
