//
//  GroupViewCell.swift
//  HEavyPedia
//
//  Created by david M on 03/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class GroupViewCell: UITableViewCell{
    static var mId: String = String(describing: GroupViewCell.self)
    static var mHeight: CGFloat = 200.0
    var data: Group?
    
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mPhoto: UIImageView!
    @IBOutlet weak var mGenre: UILabel!
    
    func configure(data: Group?){
        configure(image: data?.photo)
        configure(name: data?.name)
        configure(genre: data?.genre?.description)
    }
    
    override func awakeFromNib() {
        mPhoto?.image = nil
        mGenre?.text = ""
         mName?.text = ""
    }
    
    private func configure(image: String?) {
        guard let photo = image else {
            mPhoto?.image = UIImage(named: "placeholder")
            return
        }
        
        mPhoto?.image = UIImage(named: photo)
    }
    private func configure(genre: String?) {
        guard let gnr = genre else {
           
            return
        }
        mGenre.text = gnr
        
    }
    private func configure(name: String?) {
        guard let nm = name else {
           
            return
        }
        
        mName.text = nm
    }
    
}
