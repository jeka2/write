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
        
        setupTableView()
        
        checkIsUserLoggedIn()
    }
    
    private func checkIsUserLoggedIn() {
        if authManager.isUserSignedIn {
            databaseManager.getTitles { [weak self] result in
                switch result {
                case .success(let titles):
                    self?.titles = titles
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            let vc = AuthenticationViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(TitleCellTableViewCell.self, forCellReuseIdentifier: TitleCellTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hi")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleCellTableViewCell.identifier, for: indexPath) as? TitleCellTableViewCell {
            cell.textLabel?.text = titles[indexPath.row].titleName
            return cell
        }
        fatalError("Could not deque cell")
    }
    
}
