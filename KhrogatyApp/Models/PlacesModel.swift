//
//  PlacesModel.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/25/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import Foundation

var placeModel = [Places]()

struct Places {
    
    let placeTitle : String
    let placeImageURL : String
    let placeLocation : String
    let placeDescription : String
    
    init (placeTitle: String, placeImageURL: String, placeLocation: String, placeDescription: String) {
        self.placeTitle = placeTitle
        self.placeImageURL = placeImageURL
        self.placeLocation = placeLocation
        self.placeDescription = placeDescription
    }
    
}
