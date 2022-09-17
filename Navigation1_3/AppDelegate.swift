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

    // UINavigationController
    let feedNav: UINavigationController = {
        let feedNav = UINavigationController(rootViewController: FeedViewController())
        feedNav.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "house.fill"), tag: 0)

        return feedNav
    }()

    let profilNav: UINavigationController = {
        let profilNav = UINavigationController(rootViewController: LogInViewController())
        profilNav.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)

        return profilNav
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        // UITabBarController
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([feedNav, profilNav], animated: true)
        
        let navigationBar = UINavigationBarAppearance()
        navigationBar.configureWithOpaqueBackground()
        navigationBar.backgroundColor = .systemGroupedBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBar

        let tabBar = UITabBarAppearance()
        tabBar.configureWithOpaqueBackground()
        tabBar.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = tabBar

        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .systemBackground

        return true
    }
}

