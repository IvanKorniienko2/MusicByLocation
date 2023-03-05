//
//  Artist.swift
//  MusicByLocation
//
//  Created by Korniienko, Ivan (PGW) on 05/03/2023.
//

import Foundation

struct Artist: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
    }

}
