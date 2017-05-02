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
var currentUserVerifiedReward = 3.61
let timeBanInHours = 3
var lastRequestedItem = ""
var items: [String] = []
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class FirstViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var creditsLabel: UILabel!
    @IBOutlet var table: UITableView!
    var endTim: Date!
    var cur_estimate: Double!
    @IBAction func estimate(_ sender: Any) {
        cur_estimate = priceAlgorithm(firstNum: 0.6, secondNum: 1.8)
//        priceEstimate.text = "Price Estimate: " +
//            String(format: "$%.02f", locale: Locale.current, arguments: [cur_estimate])
    }
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
        //self.navigationController?.navigationBar.topItem?.title = "Scan Item"
        //timeLabel.text = "Eligible for Reward"
        //if(recentLabel.text == "Press 'Scan Item' to Scan!"){
          //  estButt.isEnabled = false
        //}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let my_items = UserDefaults.standard.object(forKey: "items") as? [String]
        
        if let temp = my_items{
            items = temp
            table.reloadData()
        }
        
        print(items)
        creditsLabel.text = "🌳Credits: \(items.count) 🌳"
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
    
//    func timePrinter() -> Void {
//        let time = timeCalculator(dateFormat: "MM/dd/yyyy hh:mm:ss a", endTime: endTim)
//        timeLabel.text = "\(time.hour!) Hours \(time.minute!) Minutes \(time.second!) Seconds"
//        rewardButton.isEnabled = false
//        estButt.isEnabled = false
//        if(time.minute! == 0 && time.second! == 0){
//            timeLabel.text = "Eligible for Reward"
//            rewardButton.isEnabled = true
//            estButt.isEnabled = true
//        }
//    }
    
    func priceAlgorithm(firstNum: Double, secondNum: Double) -> Double{
        return Double(arc4random()) / Double(UINT32_MAX) * Double(abs(firstNum - secondNum)) + Double(min(firstNum, secondNum))
    }
    
//    @IBAction func redeemButton(_ sender: Any) {
//        //if(recentLabel.text != "Press 'Scan Item' to Scan!"){
//            timeLabel.isEnabled = true
//            currentUserReward += cur_estimate
//            endTim = Date().addingTimeInterval(TimeInterval(timeBanInHours * 60 * 60))
//            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timePrinter), userInfo: nil, repeats: true)
//            timer.fire()
//            print(currentUserReward)
//        priceEstimate.text = "Price Estimate: n/a"
//        //}
//        if(recentLabel.text == "Press 'Scan Item' to Scan!"){
//            lastRequestedItem = "Water Bottle"
//        } else{
//            lastRequestedItem = recentLabel.text!
//        }
//    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }

}
