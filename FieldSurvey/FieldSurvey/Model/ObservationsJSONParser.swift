//
//  ObservationsJSONParser.swift
//  FieldSurvey
//
//  Created by Zach Swartz on 5/2/19.
//  Copyright © 2019 Zach Swartz. All rights reserved.
//

import Foundation

class ObservationsJSONParser {
    
    static let dateFormatter = ISO8601DateFormatter()
    
    class func parse(_ data: Data) -> [Observations] {
        var creatureObservations = [Observations]()
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let className = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let creatureObservation = Observations(classificationName: className, title: title, description: description, date: date) {
                                creatureObservations.append(creatureObservation)
                            }
                        }
                    }
                }
            }
        }
        return creatureObservations
    }
}
