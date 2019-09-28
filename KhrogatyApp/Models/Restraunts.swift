//
//  Restraunts.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/26/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import Foundation

var restrauntModel = [Restraunts]()

struct Restraunts {
    
    let restrauntTitle : String
    let restrauntImageURL : String
    let restrauntLocation : String
    let restrauntDescription : String
    
    init (restrauntTitle: String, restrauntImageURL: String, restrauntLocation: String, restrauntDescription: String) {
        self.restrauntTitle = restrauntTitle
        self.restrauntImageURL = restrauntImageURL
        self.restrauntDescription = restrauntDescription
        self.restrauntLocation = restrauntLocation
    }
    
}
