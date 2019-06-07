//
//  AlbumsViewController.swift
//  HEavyPedia
//
//  Created by david M on 04/06/2019.
//  Copyright © 2019 david M. All rights reserved.
//

import UIKit
class AlbumsViewController: UIViewController{
    
    let mSpacing: CGFloat = 16.0
    
    var mAlbums:[Album?] = []
    
    @IBOutlet weak var mAlbumsView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureCollectionView()
        mAlbumsView.reloadData()
        
    }
    private func  loadData(){
        mAlbums = albums
    }
    
    private func configureCollectionView(){
        mAlbumsView?.delegate = self
        mAlbumsView?.dataSource = self
        
    }
    
    
    
    
}

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(mAlbums.count )
        return mAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumViewCell.mId,
                                                      for: indexPath) as! AlbumViewCell
        // Get student data for row
        if let Album = mAlbums[indexPath.row] {
            // Configure cell view with student data
            
            cell.configure(data: Album)
        }
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = collectionView.frame.size.width / 2
        return CGSize(width: size - mSpacing,
                      height: size - mSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return mSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return mSpacing
    }
    
    // UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Launch segue navigation with segueToDetail identifier value
        // and send indexPath as parameter
        performSegue(withIdentifier: segueToDetail,
                     sender: indexPath)
    }
}

extension AlbumsViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPosition = sender as? IndexPath else {
            return
        }
        
        
        if let destinationController = segue.destination as? AlbumDetailViewController {
            destinationController.delegate = self
            destinationController.data = mAlbums[selectedPosition.row]
            
        }
    }
    
}


extension AlbumsViewController: AlbumDetailDelegate{
    func delete(albumDelete : Album?) {
        guard let album = albumDelete else {
            return
        }
        
        mAlbums.removeAll(where: { $0?.name == album.name })
        mAlbumsView.reloadData()
    }
}



