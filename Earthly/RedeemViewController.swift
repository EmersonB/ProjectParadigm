//
//  RedeemViewController.swift
//  Earthly
//
//  Created by Emery Berlik on 5/1/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit

class RedeemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneOnPress(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "You will receive your money after confimation", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.destructive, handler: { action in
            
        }))
        self.present(alert, animated: true, completion: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
