//
//  Comments.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/27/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

var commentModel = [Comments]()

struct Comments {
    
    let userImage : String
    let userName : String
    let comment : String
    let postID : Int
    
    init (userImage: String, userName: String, comment: String, postID: Int) {
        self.userImage = userImage
        self.userName = userName
        self.comment = comment
        self.postID = postID
    }
    
}
