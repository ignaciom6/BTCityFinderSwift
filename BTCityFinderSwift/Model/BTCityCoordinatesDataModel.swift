//
//  BTCityCoordinatesDataModel.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 28/02/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import Foundation

private let kLatitudeKey = "latitude"
private let kLongitudeKey = "longitude"

class BTCityCoordinatesDataModel {
    
    var latitude: Double?
    var longitude: Double?
    
    init(dictionary: [AnyHashable : Any]?) {
        latitude = dictionary?[kLatitudeKey] as? Double
        longitude = dictionary?[kLongitudeKey] as? Double
    }
}
