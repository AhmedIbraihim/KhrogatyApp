//
//  TutorialScreenThree.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/25/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit

class TutorialScreenThree: UIViewController {

    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBAction func prevButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "TabbarController")
        self.present(vc, animated: true, completion: nil);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StartButton.layer.cornerRadius = 7
        StartButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        StartButton.layer.shadowColor = UIColor.green.cgColor
        StartButton.layer.shadowOpacity = 0.4
        
    }

}
