//
//  ViewController.swift
//  location pointer
//
//  Created by the Soo-Rae's Mac on 7/9/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    var locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locations[0]
        println(locations)
        var userLocation: CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var speed = userLocation.speed
        var course = userLocation.course
        latitudeLabel.text = "Latitude: \(latitude)"
        longitudeLabel.text = "Longitude: \(longitude)"
    speedLabel.text = "Speed: \(speed) mps"
    courseLabel.text = "Course: \(course)"
    
        let geoCoder = CLGeocoder()
        var placemark: AnyObject
        var error: NSError
        geoCoder.reverseGeocodeLocation(manager.location, completionHandler: { (placemark, error) -> Void in
            if error != nil {
                println("Error: \(error.localizedDescription)")
                return
            }
            if placemark.count > 0 {
                let pm = placemark[0] as! CLPlacemark
                self.addressLabel.text = "\(pm.thoroughfare), \(pm.locality), \(pm.postalCode), \(pm.administrativeArea), \(pm.country)"
            } else {
                println("Error with data")
            }
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

