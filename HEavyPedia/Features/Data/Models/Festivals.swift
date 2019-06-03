
//
//  File.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation
class Festival{
    var photo: String?
    var name: String?
    var location: String?
    var description: String?
    
    convenience init(photo: String? = "placeholder",name: String? = nil, location: String? = nil , description: String? = nil){
        self.init()
        self.photo = photo
        self.name = name
        self.location = location
        self.description = description
    }
   
}

