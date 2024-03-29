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
    var trackList: [String]?
    var group: Group?
    var year: Date?
    // initialize the object
    convenience init(photo: String? = "placeholder",name: String? = nil, trackList: [String]? = nil, group: Group? = nil, year: Date? = nil ) {
        self.init()
        self.photo = photo
        self.name = name
        self.trackList = trackList
        self.group = group
        self.year = year
        
    }
}
