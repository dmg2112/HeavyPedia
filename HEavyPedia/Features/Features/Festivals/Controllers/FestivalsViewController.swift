//
//  FestivalsViewController.swift
//  HEavyPedia
//
//  Created by david M on 26/05/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class FestivalsViewController: UIViewController{
    @IBOutlet weak var mTable: UITableView!
    var mFestivals: [Festival]? =  festivals
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        mTable?.reloadData()
    }
    
    private func configureTableView() {
        
        mTable?.delegate = self
        mTable?.dataSource = self
    }
    
}
extension FestivalsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mFestivals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FestivalViewCell.mHeigh
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FestivalViewCell.mId,
                                                 for: indexPath) as! FestivalViewCell
        
        if let producer = mFestivals?[indexPath.row] {
            
            cell.configureScreen(fest: producer)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueToDetail,
                     sender: indexPath)
        
    }
    
    
}
extension FestivalsViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPosition = sender as? IndexPath else {
            return
        }
        
        
        if let destinationController = segue.destination as? FestivalDetailViewController {
            destinationController.delegate = self
            destinationController.data = mFestivals?[selectedPosition.row]
            
        }
    }
    
}


extension FestivalsViewController: FestivalDetailDelegate{
    func delete(festivalDelete: Festival?) {
        guard let producer = festivalDelete else {
            return
        }
        
        mFestivals?.removeAll(where: { $0.name == producer.name })
        mTable.reloadData()
    }
    

}
