//
//  ViewController.swift
//  Mosquito Bite! for VectorEcology.org
//  Developed by Waystone Design - Raleigh, North Carolina 2015
//
//  Copyright (c) 2015 Waystone Design. All rights reserved.
//
import UIKit
import CoreLocation
import Foundation
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mainButton: UIButton!
    
    //   self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation BAR - top screen - make Translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        buttonElements()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Function for button attributes - Main Page
    func buttonElements() {
        
        mainButton.layer.borderWidth = 2.0
        mainButton.layer.borderColor = (UIColor.whiteColor()).CGColor
        mainButton.layer.shadowColor = UIColor.blackColor().CGColor
        mainButton.layer.shadowOffset = CGSizeMake(5, 5)
        mainButton.layer.shadowRadius = 10
        mainButton.layer.shadowOpacity = 0.5
        mainButton.layer.masksToBounds = false
        mainButton.layer.opacity = 0.8
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("inside didChangeAuthorizationStatus * ", terminator: "")
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("inside func locationManager * ", terminator: "")
        //grab the location and do something with it
        let latestLocation = locations.last
        let coords = latestLocation!.coordinate
        print("Latitude: " + coords.latitude.description + " Longitude: " + coords.longitude.description, terminator: "")
        //stop the location service?
        locationManager.stopUpdatingLocation()
        //Testing setting to NIL **** TEMP CODE ****
        locationManager.delegate = nil
        // Date formatting
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
        let dateString = dateFormatter.stringFromDate(currentDate)
        
        // TESTING ******************* added recievedData
        // let recievedData : CLLocation! = nil
        
        if latestLocation != nil {
            //update the database // UPDATED
            sendDatatoServer(coords.longitude, latitude: coords.latitude, date: dateString)
        }
        
        /*
        else {
        // Alert
        
        let noLocationAlert = UIAlertController(title: "Airplane Mode On", message: "Location can not be found", preferredStyle: UIAlertControllerStyle.Alert)
        
        noLocationAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
        print("Handle Ok logic here")
        }))
        
        presentViewController(noLocationAlert, animated: true, completion: nil)
        }
        */
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location: " + error.localizedDescription, terminator: "")
    }
    
    @IBAction func findMyLocation(sender:AnyObject) {
        print("inside func findMyLocation * ", terminator: "")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // send the longitude, latitude, and date to the database server
    // UPDATED // Database still in decimals for Long/Lat - changed Parameters to suit
    func sendDatatoServer(longitude: Double!, latitude: Double!, date: String!) {
        
        print("inside sendDataToServer * ", terminator: "")
        
        Alamofire.request(.POST, "http://vectorecology.org/mosq_app/index.php", parameters:["latitude": latitude, "longitude": longitude, "date": date])
        
        // FAILED for Swift 2.0 upgrade
        /*  .responseString {  (request, response, data, error) in  // returns 'index.php' code - work in progress
        print("Data: \(data)", terminator: "")
        print("Request: \(request)", terminator: "")
        print("Response: \(response)", terminator: "")
        print("Error: \(error)", terminator: "")
        
        } */
    }
}