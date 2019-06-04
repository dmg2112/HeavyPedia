//
//  AlbumDetailViewController.swift
//  HEavyPedia
//
//  Created by david M on 04/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
protocol AlbumDetailDelegate {
    func delete(albumDelete: Album?)
}

class AlbumDetailViewController: UIViewController{
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mCover: UIImageView!
    @IBOutlet weak var mBand: UILabel!
    @IBOutlet weak var mTrackListView: UITableView!
    @IBOutlet weak var mRelease: UILabel!
    
    
    
    @IBAction func onDeletePressed(sender: UIButton) {
        showAlert(title: NSLocalizedString("title_alert_album", comment: ""),
                  message: NSLocalizedString("message_alert_album", comment: ""),
                  actionAccept: { _ in
                    self.navigateBack()
        })
    }
    
    
    
    var delegate: AlbumDetailDelegate?
    var data: Album?
    var mTracks: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare(album: data)
    }
    
    private func configure(name: String?){
        guard let nm = name else{
            return
        }
        mName.text = nm
    }
    
    private func configure(band: String?){
        guard let bnd = band else{
            return
        }
        mBand.text = bnd
    }
    
    private func configure(photo: String?) {
        guard let image = photo else {
            return
        }
        
        mCover.image = UIImage(named: image)
    }
   
    private func configure(release: String?){
        guard let rls = release else {
            return
        }
        mRelease.text = rls
        
        
    }
    
    
    func prepare(album: Album?){
        configure ()
        
        
    }
    private func configure(){
        configure(name: data?.name)
        configure(photo: data?.photo)
        configure(release: data?.year?.formatter())
        configure(tracks : data?.trackList)
        configure(band: data?.group?.name)
        
    }
    private func configure(tracks: [String]?){
        guard let list = tracks else{
            return
        }
        mTracks = list
        
        mTrackListView.delegate = self
        mTrackListView.dataSource = self
        
        
        
        
    }
    private func navigateBack(){
        delegate?.delete(albumDelete: data)
        navigationController?.popViewController(animated: true)
    }
    
}
extension AlbumDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTracks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AlbumSongViewCell.mHeigh
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumSongViewCell.mId,
                                                 for: indexPath) as! AlbumSongViewCell
        
        if let track = mTracks?[indexPath.row] {
            
            
            cell.configure(song: track)
        }
        
        return cell
    }
    
    
    
}

