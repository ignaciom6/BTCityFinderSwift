//
//  BTListFromFileService.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 29/03/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class BTListFromFileService: NSObject {
    
    func getArrayFromFile(file: String, format: String, withCompletion completion: @escaping (_ value:[AnyHashable]?, _ error: Error?) -> Void) {
        let path = Bundle.main.path(forResource: file, ofType: format)
        let data = NSData(contentsOfFile: path ?? "") as Data?

        if data != nil {
            let resultArray = try? JSONSerialization.jsonObject(with: data!, options: [])
            completion(resultArray as? [AnyHashable], nil)
        } else {
            let error = NSError(domain: "BTCityListFromFileService", code: -1, userInfo: [
                "error": "Could not retrieve file"
            ])
            completion(nil, error)
        }
    }

}
