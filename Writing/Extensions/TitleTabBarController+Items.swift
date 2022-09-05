//
//  TitleTabBarController+Items.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/5/22.
//

import UIKit

extension TitleTabBarController {
    
    static func createFilledTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let titleDetailsVC = UINavigationController.createDetailsNavigationController()
        tabBarController.viewControllers = [titleDetailsVC]
        return tabBarController
    }
    
}
