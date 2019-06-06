//
//  MusicianDetailViewController.swift
//  HEavyPedia
//
//  Created by david M on 05/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
protocol MusicianDetailDelegate {
    func delete(MusicianDelete: Musician?)
}
class MusicianDetailViewController: UIViewController{
    
    @IBOutlet weak var mName: UILabel?
    @IBOutlet weak var mLife: UILabel?
    @IBOutlet weak var mPhoto: UIImageView?
    @IBOutlet weak var mBandsView: UITableView?
    
    @IBAction func onDelete(sender: UIButton) {
        showAlert(title: NSLocalizedString("title_alert_musician", comment: ""),
                  message: NSLocalizedString("message_alert_musician", comment: ""),
                  actionAccept: { _ in
                    self.navigateBack()
        })
    }
    
    var delegate: MusicianDetailDelegate?
    var data: Musician?
    var mBands: [Group]? = []
    
    
    
    override func viewDidLoad() {
        prepare()
    }
    
    
    private func prepare(){
        
        configureTableView(member:data)
        configure(birth: data?.birth, defunc: data?.defunction)
        configure(name: data?.name, surname: data?.surname
        )
        configure(image: data?.photo)
        
        
    }
    
    //changes the image to the photo of the artist or to a placeholder if nil
    private func configure(image: String?){
        guard let img = image else{
            mPhoto?.image = UIImage(named: "placeholder")
            return
        }
        
        mPhoto?.image = UIImage(named: img)
    }
    
    //changes the label text to name surname
    private func configure(name: String?, surname : String?){
        guard let nm = name,let sr = surname else{
            return
        }
        
        let artist = "\(nm) \(sr)"
        mName?.text = artist
    }
    
    //prepares the date and checks wether the defunction date is nil or set
    private func configure(birth: Date? , defunc: Date?){
        guard let brth = birth else{
            return
        }
        if let defunct = defunc{
            mLife?.text = "\(brth.formatter())-\(defunct.formatter())"
        }else{
            mLife?.text = "\(brth.formatter())"
        }
        
        
    }
    
    //searches the members and past members of each group, for each group creates an array of strings and checks wether the full name of this musician is in it. If true, adds the group to the list
    private func configureTableView(member: Musician?){
        mBandsView?.dataSource = self
        mBandsView?.delegate = self
        guard let nm = member?.name,let sr = member?.surname else{
            return
        }
        
        let artist = "\(nm) \(sr)"
        print(artist)
        mBands = groups.filter{
            var names: [String] = []
            
            $0.members?.forEach{
                guard let name = $0.name , let surname = $0.surname else{
                    return
                }
                let member = "\(name) \(surname)"
                names.append(member)
                
            }
            $0.pastMembers?.forEach{
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
        mBandsView?.reloadData()
        
    }
    
    private func navigateBack(){
        delegate?.delete(MusicianDelete: data)
        navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension MusicianDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mBands?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = 115.0
        return height
    }
    //Configure the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupViewCell.mId,
                                                 for: indexPath) as! GroupViewCell
        
        if let group = mBands?[indexPath.row] {
            cell.configure(data: group)
        }
        
        return cell
    }
    
    
}




