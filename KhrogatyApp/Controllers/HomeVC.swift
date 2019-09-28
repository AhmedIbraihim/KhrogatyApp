//
//  ViewController.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/24/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var homeTable: UITableView!
    
    let tableSections = ["One","Two","Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}



extension HomeVC : UITableViewDelegate, UITableViewDataSource , UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK:- TableView's Delegate and DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = homeTable.dequeueReusableCell(withIdentifier: "placesTableCell", for: indexPath) as! PlacesToGoTableCell
        
        // Hidding the cell Highlight when pressed
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    // MARK:- CollectionView's Delegate and DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of Place models elements \(placeModel.count)")
        return placeModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as! PlacesToGoCollectionCell
        
        // Attempting to switch on which is the current section :'(
        switch indexPath.section {
            
        case 0 :
            print("Case 0")
            cell.placeTitle.text = placeModel[indexPath.row].placeTitle
            cell.placeLocation.text = placeModel[indexPath.row].placeLocation
            // Using Kingfisher to fetch the image and view it
            let imageURL = placeModel[indexPath.row].placeImageURL
            cell.placeImage.kf.setImage(with: URL(string: imageURL))
            
        case 1 :
            print("Case 1")
            cell.placeTitle.text = restrauntModel[indexPath.row].restrauntTitle
            cell.placeLocation.text = restrauntModel[indexPath.row].restrauntTitle
            let imageURL = restrauntModel[indexPath.row].restrauntImageURL
            cell.placeImage.kf.setImage(with: URL(string: imageURL))
            
        case 2 :
            print("Case 2")
            cell.placeTitle.text = activityModel[indexPath.row].activityTitle
            cell.placeLocation.text = activityModel[indexPath.row].activityLocation
            let imageURL = activityModel[indexPath.row].activityImageURL
            cell.placeImage.kf.setImage(with: URL(string: imageURL))
            
        default :
            print("case Default")
            return cell
        }
        
        return cell
    }
    
}
