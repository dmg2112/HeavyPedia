//
//  GroupDetailViewController.swift
//  HEavyPedia
//
//  Created by david M on 03/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//
import UIKit
protocol GroupDetailDelegate {
    func delete(GroupDelete: Group?)
}

class GroupDetailViewController: UIViewController{
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mPhoto: UIImageView!
    @IBOutlet weak var mDebut: UILabel!
    @IBOutlet weak var mMembers: UILabel!
    
    
    
    
    
    @IBAction func onDelete(sender: UIButton) {
        showAlert(title: NSLocalizedString("title_alert_group", comment: ""),
                  message: NSLocalizedString("message_alert_group", comment: ""),
                  actionAccept: { _ in
                    self.navigateBack()
        })
    }
    
    
    var delegate: GroupDetailDelegate?
    var data: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare(fest: data)
    }
    
    private func configure(name: String?){
        guard let nm = name else{
            return
        }
        mName.text = nm
    }
    
    private func configure(photo: String?) {
        guard let image = photo else {
             mPhoto.image = UIImage(named: "placeholder")
            
            return
        }
        
        mPhoto.image = UIImage(named: image)
        
    }
    
    private func configure(debut: String?){
        guard let dbut = debut else {
            return
        }
        mDebut.text = dbut
        
        
        
        
    }
    
    private func configure(band: [Musician]?){
        var text = ""
        band?.forEach{
            guard let name = $0.name,let surname = $0.surname else{
                return
            }
            text = text + "\(name) \(surname) \r\n "
            
        }
        mMembers.text = text
        
        
        
        
    }
    
    func prepare(fest: Group?){
        configure ()
        
        
    }
    
    private func configure(){
        configure(name: data?.name)
        configure(photo: data?.photo)
        configure(debut: data?.debut?.formatter())
        configure(band: data?.members)
        
    }
    
    private func navigateBack(){
        delegate?.delete(GroupDelete: data)
        navigationController?.popViewController(animated: true)
    }
}



