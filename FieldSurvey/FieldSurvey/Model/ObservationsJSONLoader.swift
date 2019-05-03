//
//  ObservationsJSONLoader.swift
//  FieldSurvey
//
//  Created by Zach Swartz on 5/2/19.
//  Copyright © 2019 Zach Swartz. All rights reserved.
//

import Foundation

class ObservationsJSONLoader {
    class func load(fileName: String) -> [Observations] {
        var observations = [Observations]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            
            observations = ObservationsJSONParser.parse(data)
        }
        return observations
    }
}
