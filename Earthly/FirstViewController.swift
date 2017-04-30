//
//  FirstViewController.swift
//  Earthly
//
//  Created by Emery Berlik on 4/29/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet var recentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Scan Item"
        // Do any additional setup after loading the view, typically from a nib.
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


}

