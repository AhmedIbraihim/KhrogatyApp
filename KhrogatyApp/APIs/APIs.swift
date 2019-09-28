//
//  APIs.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/25/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    class func getPlaces (url: String, completion: @escaping (_ error: Error?, _ success: Bool)-> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            
            switch response.result {
            case .success(let value) :
                let json = JSON(value).array ?? []
                
                for item in json {
                    let title = item["title"]["rendered"].string ?? "Default title"
                    let imageURL = item["better_featured_image"]["source_url"].string ?? ""
                    let location = item["acf"]["address"].string ?? "Default Location"
                    let description = item["excerpt"]["rendered"].string ?? "Default Description"
                    let placesObject = Places(placeTitle: title, placeImageURL: imageURL, placeLocation: location, placeDescription: description)
                    placeModel.append(placesObject)
                }
                completion(nil, true)
            case .failure(let error) :
                completion(error, false)
            }
        }
    }
    
    class func getRestraunts (url: String, completion: @escaping (_ error: Error?, _ success: Bool)-> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            
            switch response.result {
            case .success(let value) :
                let json = JSON(value).array ?? []
                
                for item in json {
                    let title = item["title"]["rendered"].string ?? "Default title"
                    let imageURL = item["better_featured_image"]["source_url"].string ?? ""
                    let description = item["excerpt"]["rendered"].string ?? "This is the default description"
                    let location = item["acf"]["address"].string ?? "Default Location"
                    let restrauntObject = Restraunts(restrauntTitle: title, restrauntImageURL: imageURL, restrauntLocation: location, restrauntDescription: description)
                    restrauntModel.append(restrauntObject)
                }
                completion(nil, true)
            case .failure(let error) :
                completion(error, false)
            }
        }
    }
    
    class func getActivites (url: String, completion : @escaping (_ error: Error?, _ success: Bool)-> Void) {
        let url = URLs.activitiesURL
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let value) :
                let json = JSON(value).array ?? []
                for item in json {
                    let title = item["title"]["rendered"].string ?? "Default title"
                    let imageURL = item["better_featured_image"]["source_url"].string ?? ""
                    let location = item["acf"]["address"].string ?? "Default Location"
                    let activityObject = Activities(activityTitle: title, activityImageURL: imageURL, activityLocation: location)
                    activityModel.append(activityObject)
                }
                completion(nil, true)
            case .failure(let error) :
                completion(error, false)
            }
        }
    }
    
    class func getComments (url: String, completion: @escaping (_ error: Error?, _ success: Bool)-> Void) {
        let parameters = [
            "id" : 7
        ]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value).array ?? []
                for item in json {
                    let name = item["author_name"].string ?? "Default user name"
                    let imageURL = item["author_avatar_urls"]["24"].string ?? "Default image"
                    let comment = item["content"]["rendered"].string ?? "Default Comment"
                    let postID = item["id"].int ?? 7
                    let commentObject = Comments(userImage: imageURL, userName: name, comment: comment, postID: postID)
                    commentModel.append(commentObject)
                }
                completion(nil, true)
            case .failure(let error):
                completion(error, false)
            }
        }
    }
    
    class func postComments (url: String, userName: String, userEmail: String, content: String, postID: Int, completion: @escaping (_ error: Error?, _ success: Bool)-> Void) {
        
        let url = URLs.postComments
        let parameters = [
            "author_name" : userName,
            "author_email" : userEmail,
            "content" : content,
            "post" : postID
            ] as [String : Any]
        Alamofire.request(url, method: .post
            , parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {
                response in
                switch response.result {
                case .success(let value):
                    completion(nil, true)
                    let json = JSON(value)
                    let message = json["message"].string ?? "Default message"
                case .failure(let error):
                    completion(error, false)
                }
        }
    }
    
}
