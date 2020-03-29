//
//  BTCityModel.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 28/02/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import Foundation

private let kNameKey = "name"
private let kCountryKey = "country"
private let kIdKey = "_id"
private let kCoordKey = "coord"

class BTCityModel {
    
    var name: String?
    var country: String?
    var cityId: Double?
    var coordDataModel: BTCityCoordinatesDataModel?
    
    init(dictionary: [AnyHashable : Any]?) {
        name = dictionary?[kNameKey] as? String
        country = dictionary?[kCountryKey] as? String
        cityId = dictionary?[kIdKey] as? Double
        coordDataModel = BTCityCoordinatesDataModel(dictionary: dictionary?[kCoordKey] as? [AnyHashable : Any])
    }
    
}
