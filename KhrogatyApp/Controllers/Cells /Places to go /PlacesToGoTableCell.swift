//
//  PlacesToGoCell.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/26/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class PlacesToGoTableCell: UITableViewCell {


    
    @IBOutlet weak var placesCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let url = URLs.placesURL
        API.getPlaces(url: url) { (error: Error?, success: Bool) in
            if success {
                self.placesCollectionView.reloadData()
            }
        }
    }

}

extension PlacesToGoTableCell {
    
    // Setting the collectionViews DataSource and Delegate
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        
        placesCollectionView.delegate = dataSourceDelegate
        placesCollectionView.dataSource = dataSourceDelegate
        placesCollectionView.tag = row
        placesCollectionView.reloadData()
        
    }
    
}
