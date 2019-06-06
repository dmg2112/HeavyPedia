//
//  Group.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation

class Group{
    var photo: String?
    var name: String?
    var debut: Date?
    var members: [Musician]?
    var retirement: Date?
    var genre: Genre?
    var pastMembers:[Musician]?
    convenience init(photo: String? = "placeholder",name: String? = nil, debut: Date? = nil, members: [Musician]? = nil, retirement: Date? = nil, genre: Genre? = .heavy, past: [Musician]? = nil
        ){
        self.init()
        self.pastMembers = past
        self.photo = photo
        self.name = name
        self.debut = debut
        self.members = members;
        self.retirement = retirement
        self.genre = genre
        
    }
    
    
}
