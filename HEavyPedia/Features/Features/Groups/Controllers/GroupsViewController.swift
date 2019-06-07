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
    
    @IBOutlet weak var mGroupsView: UITableView!
    
    var mGroups: [Group]? = groups
    
    
    //prepare the view with the data
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        mGroupsView?.reloadData()
    }
    //asign the tableview delegate and datasource
    private func configureTableView() {
        
        mGroupsView?.delegate = self
        mGroupsView?.dataSource = self
    }
    
}

extension GroupsViewController: UITableViewDataSource, UITableViewDelegate {
    //return the number of cells that will be present
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mGroups?.count ?? 0
    }
    //return the height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GroupViewCell.mHeight
    }
    //prepare the cell if exists and the identifier is correct, returning it configured
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupViewCell.mId,
                                                 for: indexPath) as! GroupViewCell
        
        if let group = mGroups?[indexPath.row] {
            cell.configure(data: group)
        }
        
        return cell
    }
    //perform sege if pressed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueToDetail,
                     sender: indexPath)
        
    }
    
    
}

extension GroupsViewController{
    //prepare the data and screen for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPosition = sender as? IndexPath else {
            return
        }
        
        
        if let destinationController = segue.destination as? GroupDetailViewController {
            destinationController.delegate = self
            destinationController.data = mGroups?[selectedPosition.row]
            
        }
    }
    
}


extension GroupsViewController: GroupDetailDelegate{
    //delete based on the name of the atribute, then reloads data
    func delete(GroupDelete: Group?) {
        guard let group = GroupDelete else {
            return
        }
        
        mGroups?.removeAll(where: { $0.name == group.name })
        mGroupsView.reloadData()
}
}


