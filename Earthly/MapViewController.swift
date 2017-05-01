//
//  MapViewController.swift
//  Earthly
//
//  Created by Emery Berlik on 4/30/17.
//  Copyright © 2017 Berlik. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    var matchingItems: [MKMapItem] = [MKMapItem]()
    var locManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Nearby Recycling Centers"
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startMonitoringSignificantLocationChanges()
        
        map.showsUserLocation = true
        //print(map.userLocation.coordinate.latitude)
        
        let span = MKCoordinateSpanMake(0.150, 0.150)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (locManager.location?.coordinate.latitude)!, longitude: (locManager.location?.coordinate.longitude)!), span: span)
        map.setRegion(region, animated: true)

        performSearch(search_term: "grocery")
        performSearch(search_term: "recycle")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func performSearch(search_term: String) {
        
        //matchingItems.removeAll()
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = search_term
        request.region = map.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil {
                print("Error occured in search: \(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                print("Matches found")
                
                for item in response!.mapItems {
                    print("Name = \(String(describing: item.name))")
                    print("Phone = \(String(describing: item.phoneNumber))")
                    
                    self.matchingItems.append(item as MKMapItem)
                    print("Matching items = \(self.matchingItems.count)")
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.map.addAnnotation(annotation)
                }
            }
        })
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

