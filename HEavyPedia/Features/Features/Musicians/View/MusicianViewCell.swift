//
//  MusicianViewCell.swift
//  HEavyPedia
//
//  Created by david M on 05/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class MusicianViewCell: UITableViewCell{
    static let mId = String(describing: MusicianViewCell.self)
    static let mHeight: CGFloat = 200.0
    
    var data: Musician?
    
    @IBOutlet weak var mPhoto: UIImageView!
    @IBOutlet weak var mLife: UILabel!
    @IBOutlet weak var mName: UILabel!
    
    override func prepareForReuse() {
        mName.text = ""
        mLife.text = ""
        mPhoto.image = nil
    }
    
    //call the configure functions
    func configure(data: Musician?){
        configure(image: data?.photo)
        configure(name: data?.name, surname: data?.surname)
        configure(birth: data?.birth, defunc: data?.defunction)
        
    }
    
    // configure the image
    private func configure(image: String?){
        guard let img = image else{
            mPhoto.image = UIImage(named: "placeholder")
            return
        }
        
        mPhoto.image = UIImage(named: img)
    }
    
    //configure the full name ( name + surname)
    private func configure(name: String?, surname: String?){
        guard let nm = name, let sr = surname else{
            return
        }
        mName.text = "\(nm) \(sr)"
    }
    
    //configure the life text ( birth-death)
    private func configure(birth: Date? , defunc: Date?){
        guard let brth = birth else{
            return
        }
        if let defunct = defunc{
            mLife.text = "\(brth.formatter())-\(defunct.formatter())"
        }else{
            mLife.text = "\(brth.formatter())"
        }
        
        
    }
    
}
