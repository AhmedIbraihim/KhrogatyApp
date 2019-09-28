//
//  AppDelegate.swift
//  KhrogatyApp
//
//  Created by Ahmed Ibrahim on 9/24/19.
//  Copyright © 2019 Ahmed Ibrahim. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hasTutoriolsBeenSeen : Bool = false 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Making the splash screen wait for 1 second
        RunLoop.current.run(until: NSDate(timeIntervalSinceNow:1) as Date)
        
        
        // Checking weather or not this is the first time running the app
        if UserDefaults.standard.bool(forKey: "didSee") {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "TabbarController")
            self.window?.rootViewController = viewController
            self.window?.makeKeyAndVisible()
            
        } else {
            UserDefaults.standard.set(true, forKey: "didSee")
        }
        
        IQKeyboardManager.shared().isEnabled = true

        return true
    }

  
}

