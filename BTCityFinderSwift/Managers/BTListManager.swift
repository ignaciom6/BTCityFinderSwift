//
//  BTListManager.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 29/03/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class BTListManager: NSObject {

    func getArrayForFile(file: String, type: String, modelManager modelMgr: BTModelManager, withCompletion completion: @escaping (_ value: [BTBaseModel]?, _ error: Error?) -> Void) {
        let cityListService = BTListFromFileService()
        
        cityListService.getArrayFromFile(file: file, format: type) { (value, error) in
            if value != nil {
                completion(modelMgr.createModelWithArray(array: value!), nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
}
