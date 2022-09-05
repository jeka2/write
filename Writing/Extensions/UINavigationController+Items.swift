//
//  UINavigationController+Items.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/5/22.
//

import UIKit

extension UINavigationController {
    
    static func createDetailsNavigationController() -> UINavigationController {
        let detailsVC = TitleDetailViewController()
        detailsVC.title = "Details"
        detailsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: detailsVC)
    }
    
}
