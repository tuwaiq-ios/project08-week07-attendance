//
//  TabBarController.swift
//  Students Attendance
//
// Created by PC on 05/04/1443 AH.
//

import UIKit


class TabBarController: UITabBarController {
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: StudentsViewController(), title: NSLocalizedString("Students", comment: ""), image: UIImage(systemName: "person")!),
            createNavController(for: DaysViewController(), title: NSLocalizedString("Days", comment: ""), image: UIImage(systemName: "calendar.circle")!)
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
}
