//
//  RestrauntsVC.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/25/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher

class RestrauntsVC: UIViewController {

    
    var indexPathAtRow = Int()
    
    @IBOutlet weak var restrauntsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "theme-header"), for: .default)
        let url = URLs.restrauntsURL
        API.getRestraunts(url: url) { (error: Error?, success: Bool) in
            if success {
                self.restrauntsTable.reloadData()
            }
        }
    }
    
}



extension RestrauntsVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restrauntModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = restrauntsTable.dequeueReusableCell(withIdentifier: "restrauntCell", for: indexPath) as! RestrauntsCell
        cell.selectionStyle = .none
        cell.restrauntName.text = restrauntModel[indexPath.row].restrauntTitle
        cell.restrauntDescription.text = restrauntModel[indexPath.row].restrauntDescription
        cell.restrauntLocation.text = restrauntModel[indexPath.row].restrauntLocation
        let imageURL = restrauntModel[indexPath.row].restrauntImageURL
        cell.restrauntImage.kf.setImage(with: URL(string: imageURL))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPathAtRow = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // passing indexPath to next screen (will be using it to populate the next screen when using restraunt Model)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRestrauntDetails" {
            let vc = segue.destination as! RestrauntsDetailsVC
            vc.indexPathAtRow = self.indexPathAtRow
        }
    }
    
}
