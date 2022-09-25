//
//  TabBarController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 17.09.2022.
//

import UIKit

class TabBarController: UITabBarController {

    // UINavigationController
    let feedNav: UINavigationController = {
        let feedNav = UINavigationController(rootViewController: FeedViewController())
        feedNav.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "house.fill"), tag: 0)

        return feedNav
    }()

    let profilNav: UINavigationController = {
        let profilNav = UINavigationController(rootViewController: ProfileViewController())
        profilNav.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)

        return profilNav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurationTabBar()
    }
    
    private func configurationTabBar() {
        
        // UITabBarController
        setViewControllers([feedNav, profilNav], animated: true)
        
        let navigationBar = UINavigationBarAppearance()
        navigationBar.configureWithOpaqueBackground()
        navigationBar.backgroundColor = .systemGroupedBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBar

        let tabBar = UITabBarAppearance()
        tabBar.configureWithOpaqueBackground()
        tabBar.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = tabBar
    }
}
