//
//  RestrauntsDetailsVC.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/26/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class RestrauntsDetailsVC: UIViewController {

    // Getting the indexPath form previous screen and using it to access the Restraunt Model
    var indexPathAtRow : Int = 0
    
    // url for getting comments function
    let url = URLs.getCommentsURL

    
    @IBOutlet weak var descriptionBG: UIView!
    @IBOutlet weak var infoBG: UIView!
    @IBOutlet weak var restrauntImage: UIImageView!
    @IBOutlet weak var restrauntName: UILabel!
    @IBOutlet weak var restrauntDescription: UILabel!
    @IBOutlet weak var restrauntLocation: UILabel!
    @IBOutlet weak var restrauntsNumber: UILabel!
    @IBOutlet weak var restrauntsEmail: UILabel!
    @IBOutlet weak var commentsTable: UITableView!
    @IBOutlet weak var addCommentTF: UITextField!
    
    @IBAction func sendCommentPressed(_ sender: UIButton) {
        let url = URLs.postComments
        
        // Dummy data since i have no user to upload his info
        let userName = "Ahmed"
        let userEmail = "Ahmed@ahmed.com"
        guard let commentContent = addCommentTF.text else {return}
        
        let postID = commentModel[indexPathAtRow].postID
        
        // uploading the comment
        API.postComments(url: url, userName: userName, userEmail: userEmail, content: commentContent, postID: postID) { (error: Error?, success: Bool) in
            if success {
                print("Your comment has been successfuly uploaded!")
                self.commentsTable.reloadData()
            } else {
                print("Check again")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting Navigation Bar title
        self.navigationItem.title = restrauntModel[indexPathAtRow].restrauntTitle
        
        // Setting Views drop shadows
        descriptionBG.customBG(descriptionBG, shadowOpacity: 0.3)
        infoBG.customBG(infoBG, shadowOpacity: 0.3)
        
        // customizing Textfield
        addCommentTF.layer.cornerRadius = 10
        addCommentTF.layer.shadowOffset = CGSize(width: 0, height: 1)
        addCommentTF.layer.shadowColor = UIColor.gray.cgColor
        addCommentTF.layer.shadowOpacity = 0.3
        addCommentTF.layer.shadowRadius = 5
        
        // Populating Screen with data
        restrauntName.text = restrauntModel[indexPathAtRow].restrauntTitle
        restrauntDescription.text = restrauntModel[indexPathAtRow].restrauntDescription
        restrauntLocation.text = restrauntModel[indexPathAtRow].restrauntLocation
        let imageURL = restrauntModel[indexPathAtRow].restrauntImageURL
        restrauntImage.kf.setImage(with: URL(string: imageURL))
    }

}



extension RestrauntsDetailsVC : UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
        API.getComments(url: url) { (error: Error?, success: Bool) in
            if success {
                self.commentsTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = commentsTable.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! CommentsTableCell

        let imageURL = commentModel[indexPath.row].userImage
        cell.userImage.kf.setImage(with: URL(string: imageURL))
        cell.userName.text = commentModel[indexPath.row].userName
        cell.comment.text = commentModel[indexPath.row].comment
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


// function for customizing Views
extension UIView {
    
    func customBG (_ view: UIView, shadowOpacity: Float) {
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = 5
    }
}

