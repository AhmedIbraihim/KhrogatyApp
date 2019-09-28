//
//  PlacesToGoCollectionCell.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/26/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class PlacesToGoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeLocation: UILabel!
    
    
    override func awakeFromNib() {
        placeImage.layer.cornerRadius = 10
        placeImage.clipsToBounds = true
    }
    
}
