//
//  ProducerViewCell.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class FestivalViewCell: UITableViewCell{
    
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mLocation: UILabel!
    @IBOutlet weak var mPhoto: UIImageView!
    @IBOutlet weak var mView: UIView!
    
    
    
    
    static var mHeigh: CGFloat = 200
    
    static var mId: String = String(describing: FestivalViewCell.self)
    
    func configureScreen(fest: Festival?){
        configure(name:fest?.name)
        configure(image: fest?.photo)
        configure(location: fest?.location)
        
    }
    private func configure(name: String?){
        guard let nm = name else{
            return
        }
        mName?.text = "\(nm)  "
        
    }
    
    override func prepareForReuse() {
        mName?.text = ""
        mPhoto?.image = nil
       
    }
    
    private func configure(image: String?) {
        guard let photo = image else {
            mPhoto?.image = UIImage(named: "placeholder")
            return
        }
        
        mPhoto?.image = UIImage(named: photo)
    }
    
    private func configure(location: String?) {
        guard let loc = location else {
            
            return
        }
        print("festival in \(loc)")
       mLocation.text = loc
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure(view: mView)
        
    }
    
    
    
    
    
    
    
    
    
}
