//
//  ViewController.swift
//  iOS_Location
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //create a variable of the CL_LOCATION_MANAGER
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // getting the user location
        let userlocation :CLLocation = locations[0]
    // print(userlocation)
        
      //finding the user address from the user location
        CLGeocoder().reverseGeocodeLocation(userlocation){
            (placemark,error) in
            if let error = error {
                print(error)
            }
            else{
                if let placemarks = placemark?[0]{
                    var subThoroufare = ""
                    if placemarks.subThoroughfare != nil
                    {
                        subThoroufare = placemarks.subThoroughfare!
                    }
                     var thoroufare = ""
                    if placemarks.thoroughfare != nil{
                        thoroufare = placemarks.thoroughfare!
                    }
                    var subLocality = ""
                    if placemarks.subLocality != nil{
                        subLocality = placemarks.subLocality!
                    }
                    var subAdministrativeArea=""
                    if placemarks.subAdministrativeArea != nil{
                        subAdministrativeArea = placemarks.subAdministrativeArea!
                    }
                    var postalCode = ""
                     if placemarks.postalCode != nil
                           {
                             postalCode=placemarks.postalCode!
                           }
                            
                    var country=""
                           if placemarks.country != nil
                           {
                             country=placemarks.country!
                           }
                            
                    print(subThoroufare + "\n" + thoroufare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                }
            }
        }
        
    }
    

}

