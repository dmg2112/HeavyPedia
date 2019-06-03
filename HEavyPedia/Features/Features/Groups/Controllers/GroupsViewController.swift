//
//  Groups.swift
//  HEavyPedia
//
//  Created by david M on 03/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class GroupsViewController: UIViewController{
    var mSpacing: CGFloat = 15.0
    @IBOutlet weak var mGroupsView: UICollectionView!
    var mGroups: [Group]? = groups
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        mGroupsView?.reloadData()
    }
    
    private func configureTableView() {
        
        mGroupsView?.delegate = self
        mGroupsView?.dataSource = self
    }
    
}
extension GroupsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mGroups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupViewCell.mIdentifier,
                                                      for: indexPath) as! GroupViewCell
        // Get student data for row
        if let group = mGroups?[indexPath.row] {
            // Configure cell view with student data
            cell.configureCell(data: group)
        }
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.size.width / 2
        return CGSize(width: size - mCellSpacing,
                      height: size - mCellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return mCellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return mCellSpacing
    }
    
    // UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Launch segue navigation with segueToDetail identifier value
        // and send indexPath as parameter
        performSegue(withIdentifier: segueToDetail,
                     sender: indexPath)
    }
}

extension GroupsViewController: GroupDetailDelegate{
    func delete(GroupDelete: Group?) {
        guard let producer = GroupDelete else {
            return
        }
        
        mGroups?.removeAll(where: { $0.name == producer.name })
        mTable.reloadData()
}
}

