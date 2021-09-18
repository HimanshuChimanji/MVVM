//
//  AppDelegate.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 18/09/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Override point for customization after application launch.
        window = UIWindow(frame:UIScreen.main.bounds)
        let songVC = SongsVC(nibName: "SongsVC", bundle: nil)
        let navController = UINavigationController(rootViewController: songVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }


}

