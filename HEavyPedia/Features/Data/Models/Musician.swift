//
//  Musician.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation
class Musician{
    var photo: String?
    var name: String?
    var surname: String?
    var birth: Date?
    var defunction: Date?
    
    convenience init(photo: String? = "placeholder",name: String? = nil, surname: String? = nil, birth: Date? = nil, defunction: Date? = nil){
        self.init()
        self.photo = photo
        self.name = name
        self.surname = surname
        self.birth = birth
        self.defunction = defunction
    }
}
