//
//  Activities.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/27/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import Foundation

var activityModel = [Activities]()

struct Activities {
    
    let activityTitle : String
    let activityImageURL : String
    let activityLocation : String
    
    init (activityTitle: String, activityImageURL: String, activityLocation: String) {
        self.activityTitle = activityTitle
        self.activityImageURL = activityImageURL
        self.activityLocation = activityLocation
    }
    
}
