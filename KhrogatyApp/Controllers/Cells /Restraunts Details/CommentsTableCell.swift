//
//  CommentsTableCell.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/27/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class CommentsTableCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.clipsToBounds = true
    }

}
