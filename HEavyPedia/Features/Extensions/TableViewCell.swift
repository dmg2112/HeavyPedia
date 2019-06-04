//
//  TableViewCell.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import Foundation
import UIKit

// Extension of TableViewCell
extension UITableViewCell {
    
    // Add a custom method in TableViewCell class to
    // confugure corner radius and shadow opacity
    func configure(cornerRadius: CGFloat = 8.0,
                   view: UIView?) {
        view?.layer.cornerRadius = cornerRadius
    }
}
