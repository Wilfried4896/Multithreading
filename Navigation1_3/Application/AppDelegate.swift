//
//  AppDelegate.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.06.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationContoller = UINavigationController()
        
        window?.rootViewController = navigationContoller
        window?.makeKeyAndVisible()
        
        coordinator = AppCoordinator(navController: navigationContoller)
        
        coordinator?.start()

        return true
    }
}

