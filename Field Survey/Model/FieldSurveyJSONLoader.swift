//
//  FieldSurveyJSONLoader.swift
//  Field Survey
//
//  Created by Brian Lasker on 7/20/18.
//  Copyright © 2018 Brian Lasker. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    
    class func load (fileName : String) -> [FieldSurvey] {
        var observations = [FieldSurvey]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = FieldSurveyJSONParser.parse(data)
        }
        
        return observations
    }
}
