//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Korniienko, Ivan (PGW) on 03/03/2023.
//

import Foundation
import CoreLocation

class LocationHandler {
    let manager = CLLocationManager()
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
}
