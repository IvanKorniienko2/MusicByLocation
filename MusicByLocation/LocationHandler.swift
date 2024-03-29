//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Korniienko, Ivan (PGW) on 03/03/2023.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    weak var stateController: StateController?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: {(placemarks, error) in
                if error != nil {
                    self.stateController?.lastKnownLocation = "Could not perform lookup of location from coordinate information"
                } else {
                    if let firstPlacemark  = placemarks?[0] {
                        self.stateController?.lastKnownLocation = firstPlacemark.locality ?? ""
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.stateController?.lastKnownLocation = "Error finding location"
    }
}
