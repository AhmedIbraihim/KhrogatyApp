//
//  RestrauntsCell.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/25/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class RestrauntsCell: UITableViewCell {

    @IBOutlet weak var restrauntImage: UIImageView!
    @IBOutlet weak var restrauntName: UILabel!
    @IBOutlet weak var restrauntDescription: UILabel!
    @IBOutlet weak var restrauntLocation: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Customizing the UI Elements 
        bgView.customBG(bgView, shadowOpacity: 0.16)
        
        restrauntImage.layer.cornerRadius = 10
        restrauntImage.clipsToBounds = true
        
        detailsButton.layer.cornerRadius = 8
        detailsButton.clipsToBounds = true
        
    }
    
}

