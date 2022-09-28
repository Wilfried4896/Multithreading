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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        let loginFactory = MyLoginFactory(loginInspector: LoginInspector())
        
        let logInViewController = LogInViewController()
        logInViewController.loginDelegate = loginFactory
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = logInViewController
        window.makeKeyAndVisible()
        
        self.window = window
        self.window?.backgroundColor = .white

        return true
    }
}

