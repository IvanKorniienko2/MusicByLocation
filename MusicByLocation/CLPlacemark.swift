//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Korniienko, Ivan (PGW) on 05/03/2023.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakdown() -> String {
        return
            """
            Street: \(self.thoroughfare ?? "None")
            City: \(self.locality ?? "None")
            Area: \(self.administrativeArea ?? "None")
            Country: \(self.country ?? "None")
            """
    }
}
