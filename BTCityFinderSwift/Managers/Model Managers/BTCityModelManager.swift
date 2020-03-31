//
//  BTCityModelManager.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 29/03/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class BTCityModelManager: BTModelManager {
    func createModelWithArray(array: [AnyHashable]) -> [BTBaseModel] {
        var citiesResultArray: [BTCityModel] = []
        
        for cityDict in array {
            let city = BTCityModel(dictionary: cityDict as? [AnyHashable : Any])
            citiesResultArray.append(city)
        }

        return citiesResultArray
    }
}
