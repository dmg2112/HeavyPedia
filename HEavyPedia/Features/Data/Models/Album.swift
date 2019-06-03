//
//  Albums.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation
class Album{
    var photo: String?
    var name: String?
    var producer: String?
    var group: Group?
    var year: Date?
    
    convenience init(photo: String? = "placeholder",name: String? = nil, producer: String? = nil, group: Group? = nil, year: Date? = nil ) {
        self.init()
        self.name = name
        self.producer = producer
        self.group = group
        self.year = year
        
    }
}
