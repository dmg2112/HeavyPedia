//
//  AlbumViewCell.swift
//  HEavyPedia
//
//  Created by david M on 04/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class AlbumViewCell: UICollectionViewCell{
    static let mId = String(describing: AlbumViewCell.self)
    static let mHeigh: CGFloat = 150.0
    
    @IBOutlet weak var mCover: UIImageView!
    
    //prepate the cell for reuse
    override func prepareForReuse() {
        mCover.image = nil
    }
    
    //set the data and image to the data
    func configure(data: Album?){
        guard let photo = data?.photo else{
            mCover?.image = UIImage(named: "placeholder")
            return
        }
        
        
        mCover?.image = UIImage(named: photo)
        
    
    }
    
    
    
    
}
