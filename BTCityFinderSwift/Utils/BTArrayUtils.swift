//
//  BTArrayUtils.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 30/03/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class BTArrayUtils: NSObject {
    
    class func orderCityArrayByComposedName(array: [BTCityModel]) -> [BTCityModel] {
        var sortedArray = array
        
        sortedArray.sort {
            $0.composedName < $1.composedName
        }
        
        return sortedArray
    }

}
