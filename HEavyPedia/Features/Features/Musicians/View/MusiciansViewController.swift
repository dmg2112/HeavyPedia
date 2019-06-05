//
//  MusiciansViewController.swift
//  HEavyPedia
//
//  Created by david M on 05/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class MusiciansViewController: UIViewController{
    var mMusicians: [Musician]? = musicians
    @IBOutlet weak var mMusiciansView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    private func configure(){
        mMusiciansView.reloadData()
    }
}

extension MusiciansViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mMusicians?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MusicianViewCell.mHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicianViewCell.mId,
                                                 for: indexPath) as! MusicianViewCell
        
        if let musician = mMusicians?[indexPath.row] {
            cell.configure(data: musician)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueToDetail,
                     sender: indexPath)
        
    }
    
    
}


extension MusiciansViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPosition = sender as? IndexPath else {
            return
        }
        
        
        if let destinationController = segue.destination as? MusicianDetailViewController {
            destinationController.delegate = self
            destinationController.data = mMusicians?[selectedPosition.row]
            
        }
    }
    
}

extension MusiciansViewController: MusicianDetailDelegate{
    func delete(GroupDelete: Group?) {
        guard let group = GroupDelete else {
            return
        }
        
        mMusicians?.removeAll(where: { $0.name == group.name })
        mMusiciansView.reloadData()
    }
}

