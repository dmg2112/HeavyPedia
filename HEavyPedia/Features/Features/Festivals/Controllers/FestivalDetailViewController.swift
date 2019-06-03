//
//  ProducerDetailViewController.swift
//  HEavyPedia
//
//  Created by david M on 29/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
protocol FestivalDetailDelegate {
    func delete(festivalDelete: Festival?)
}

class FestivalDetailViewController: UIViewController{
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mLocation: UILabel!
    @IBOutlet weak var mPhoto: UIImageView!
    @IBOutlet weak var mDescription: UILabel!
    
    @IBAction func onDeletePressed(sender: UIButton) {
        showAlert(title: NSLocalizedString("title_alert_fest", comment: ""),
                  message: NSLocalizedString("message_alert_fest", comment: ""),
                  actionAccept: { _ in
                    self.navigateBack()
        })
    }
    
    
    var delegate: FestivalDetailDelegate?
    var data: Festival?
    
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
            return
        }
        
        mPhoto.image = UIImage(named: image)
        mPhoto.layer.cornerRadius = (self.mPhoto?.frame.size.width ?? 0) / 2
    }
    private func configure(loc: String?){
        guard let locat = loc else {
            return
        }
        mLocation.text = locat
        
        
    }
    
    func prepare(fest: Festival?){
        configure ()
       

    }
    private func configure(){
        configure(name: data?.name)
        configure(photo: data?.photo)
        configure(loc: data?.location)
        configure(descript: data?.description)
        
    }
    private func configure(descript: String?){
        guard let desc = descript else{
            return
        }
        mDescription.text = desc
    }
    private func navigateBack(){
        delegate?.delete(festivalDelete: data)
        navigationController?.popViewController(animated: true)
    }
}
