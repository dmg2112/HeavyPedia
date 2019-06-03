//
//  Date.swift
//  HEavyPedia
//
//  Created by david M on 27/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation
extension Date{
    func formatter () -> String{
        let subjectDateFormatted = DateFormatter()
        subjectDateFormatted.locale = Locale(identifier: "es_ES")
        subjectDateFormatted.dateFormat="MMMM/dd/yyyy"
        return "\(subjectDateFormatted.string(from: self))"
        
    }
    func edad() -> String {
        let now = Date()
        let calendr = Calendar.current
        let ageComponents = calendr.dateComponents([.year],from: self, to: now)
        guard let age = ageComponents.year else{
            return "0"
        }
        
        return " tiene \(age) años"
    }
}
