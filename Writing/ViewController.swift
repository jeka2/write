//
//  ViewController.swift
//  Writing/Users/yev/Desktop/Writing/Writing/ViewController.swift
//
//  Created by Yevgeniy Ivanov on 8/24/22.
//

import FirebaseDatabase
import UIKit

class ViewController: UIViewController {
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 50))
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func addNewEntry() {
        let object: [String: Any] = [
            "name": "iOS Academy" as NSObject,
            "Youtube": "yes"
        ]
        print("Clicked")
        database.child("Something").setValue(object)
    }


}

