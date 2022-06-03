//
//  AppDelegate.swift
//  animation-demo
//
//  Created by Johel Zarco on 02/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application : UIApplication, didFinishLaunchingWithOptions launchOptions : [UIApplication.LaunchOptionsKey : Any]?) -> Bool{
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemPink
        window?.rootViewController = ViewController()
        return true
    }

}

