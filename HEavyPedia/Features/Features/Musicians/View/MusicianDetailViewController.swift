//
//  MusicianDetailViewController.swift
//  HEavyPedia
//
//  Created by david M on 05/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
protocol MusicianDetailDelegate {
    func delete(GroupDelete: Group?)
}
class MusicianDetailViewController: UIViewController{
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mLife: UILabel!
    @IBOutlet weak var mPhoto: UIImageView!
    @IBOutlet weak var mBandsView: UITableView!
    
    var delegate: MusicianDetailDelegate?
    var data: Musician? = nil
    var mBands: [Group] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func prepare(data: Musician?){
        configure(member:data)
        
        
    }
    
    private func configure(member: Musician?){
        guard let nm = member?.name,let sr = member?.surname else{
            return
        }
        let artist = "\(nm) \(sr)"
        mName.text = artist
        mBands = groups.filter{
            var names: [String] = []
            
            $0.members?.forEach{
                guard let name = $0.name , let surname = $0.surname else{
                    return
                }
                let member = "\(name) \(surname)"
                names.append(member)
                
            }
            names.forEach{
                print($0)
            }
            return names.contains(artist)
        }
        mBands.forEach{
            print($0.name)
        }
        mBandsView.reloadData()
        
        
    }
    
    
    
    
}




