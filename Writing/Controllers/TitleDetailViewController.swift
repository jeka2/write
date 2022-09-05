//
//  TitleDetailViewController.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/4/22.
//

import UIKit

class TitleDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
