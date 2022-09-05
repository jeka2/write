//
//  TitleTabBarController.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/5/22.
//

import UIKit

class TitleTabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.viewControllers = [TitleDetailViewController()]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
