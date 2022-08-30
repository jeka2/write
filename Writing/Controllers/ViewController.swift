//
//  ViewController.swift
//  Writing/Users/yev/Desktop/Writing/Writing/ViewController.swift
//
//  Created by Yevgeniy Ivanov on 8/24/22.
//

import FirebaseDatabase
import UIKit

class ViewController: UIViewController {
    
    private let databaseManager = FirebaseDatabaseManager.shared
    
    private let authManager = FirebaseAuthManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        if authManager.isUserSignedIn {
            databaseManager.getInstance(of: "Something") {
                print("hi")
            }
        } else {
            let vc = AuthenticationViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 50))
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    @objc private func addNewEntry() {
//        databaseManager.setInstance(of: "Bla Blah") {
//            print("hi")
//        }
//        databaseManager.createChapter(title: "Chapter 1")
//        databaseManager.createCharacter()
//        databaseManager.createRelationship()
//        databaseManager.createOrganization()
        databaseManager.createFictionalName()
    }


}

