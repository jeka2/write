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
    
    private let tableView = UITableView()
    
    private var titles: [Title] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIsUserLoggedIn()
    }
    
    private func checkIsUserLoggedIn() {
        if authManager.isUserSignedIn {
            databaseManager.getTitles { [weak self] result in
                switch result {
                case .success(let titles):
                    print(titles)
                case .failure(let error):
                    print(error)
                }
                self?.tableView.reloadData()
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
    
    private func setupTableView() {
        tableView.register(TitleCellTableViewCell.self, forCellReuseIdentifier: TitleCellTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func addNewEntry() {
//        databaseManager.createChapter(title: "Chapter 1")
//        databaseManager.createCharacter()
//        databaseManager.createRelationship()
//        databaseManager.createOrganization()
//        databaseManager.createFictionalName()
//        databaseManager.createPlace()
//        databaseManager.createCharacter()
//        databaseManager.createRelationship()
//        databaseManager.createOrganization()
//        databaseManager.getFictionalNames { result in
//            switch result {
//            case .success(let chapters):
//                print(chapters)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleCellTableViewCell.identifier, for: indexPath) as? TitleCellTableViewCell {
            cell.textLabel?.text = titles[indexPath.row].titleName
            
        }
        fatalError("Could not deque cell")
    }
    
}
