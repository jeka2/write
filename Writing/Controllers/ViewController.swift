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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    private var titles: [Title] = []
    
    private var viewModel: TitleTableCellViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIsUserLoggedIn()
        
        setupTableView()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = titles[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell {
            cell.configure(with: TitleTableCellViewModel(model: model))
            return cell
        }
        fatalError("Could not deque cell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        AllStrings.titlesPageHeaderLabelText
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        header.textLabel?.textColor = .black
    }
    
}
