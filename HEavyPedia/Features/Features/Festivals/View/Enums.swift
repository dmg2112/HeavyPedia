//
//  Enums.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation
enum Genre: CustomStringConvertible{
    case heavy
    case thrash
    case doom
    case power
    case death
    case brutal
    case techDeath
    case speed
    case folk
    case black
    case prog
    case alt
    case nu
    case crossover
    case hardcore
    
    var description: String{
        switch self {
        case .heavy:
            return "Heavy metal"
        case .doom:
            return "Doom metal"
        case .thrash:
            return "Thrash metal"
        case .power:
            return "Power Metal"
        case .techDeath:
            return "Technical Death Metal"
        case .death:
            return "Death Metal"
        case .brutal:
            return "Brutal Death Metal"
        case .speed:
            return "Speed Metal"
        case .prog:
            return "Progressive Metal"
        case .crossover:
            return "Crossover Thrash Metal"
        case .hardcore:
            return "Hardcore Metal"
        case .alt:
            return "Alternative Metal"
        case .nu:
            return "Nü Metal"
        case .black:
            return "Black Metal"
        case .folk:
            return "Folk Metal"
        default:
            return "Own"
        }
    }
    
}
