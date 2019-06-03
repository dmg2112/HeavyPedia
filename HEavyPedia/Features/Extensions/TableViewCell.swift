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
                   shadowOpacity: Float = 0.6,
                   with color: CGColor = UIColor.gray.cgColor,
                   view: UIView?) {
        view?.layer.cornerRadius = cornerRadius
        view?.layer.shadowColor = color
        view?.layer.shadowOffset = CGSize.zero
        view?.layer.shadowRadius = cornerRadius
        view?.layer.shadowOpacity = shadowOpacity
    }
}
