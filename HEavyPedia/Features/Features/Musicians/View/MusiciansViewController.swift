//
//  MusiciansViewController.swift
//  HEavyPedia
//
//  Created by david M on 05/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class MusiciansViewController: UIViewController{
    var mMusicians: [Musician]?
    @IBOutlet weak var mMusiciansView: UITableView!
    
    //prepare the cell once it loads the view
    override func viewDidLoad() {
        super.viewDidLoad()
        mMusicians =  musicians
        configure()
        
    
    }
 
    //configure the table delegate and datasource, reloading after
    private func configure(){
        
        mMusiciansView?.delegate = self
        mMusiciansView?.dataSource = self

        mMusiciansView.reloadData()
    }
}

extension MusiciansViewController: UITableViewDataSource, UITableViewDelegate {
    
    //return the count of
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mMusicians?.count ?? 0
    }
    
    //return the cell for the height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MusicianViewCell.mHeight
    }
    //return the cell prepared
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicianViewCell.mId,
                                                 for: indexPath) as! MusicianViewCell
        
        if let musician = mMusicians?[indexPath.row] {
            
            cell.configure(data: musician)
        }
        
        return cell
    }
    
    
    //perform the segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueToDetail,
                     sender: indexPath)
        
    }
    
    
}


extension MusiciansViewController{
    //prepare the segue
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
    //delete based on full name using where clause
    func delete(MusicianDelete: Musician?) {
        guard let musician = MusicianDelete else {
            return
        }
        
        mMusicians?.removeAll(where: {
            guard let arrayName = $0.name,let arraySurname = $0.surname else {
                return false
            }
            guard let musicianName = musician.name,let musicianSurname = musician.surname else {
                return false
            }
            return (arrayName+arraySurname) == (musicianName+musicianSurname)
            
            
        })
        mMusiciansView.reloadData()
    }
}

