//
//  AuthenticationViewController.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/25/22.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    private let authManager = FirebaseAuthManager.shared
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
    }
    
    private func configureSubviews() {
        label.frame = CGRect(x: 20,
                             y: 100,
                             width: view.bounds.width - 40,
                             height: 50)
        
        emailField.frame = CGRect(x: 20,
                                  y: label.frame.origin.y + label.frame.height + 10,
                                  width: view.bounds.width - 40,
                                  height: 50)
        
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y + emailField.frame.height + 10,
                                     width: view.bounds.width - 40,
                                     height: 50)
        
        button.frame = CGRect(x: 20,
                              y: passwordField.frame.origin.y + passwordField.frame.height + 30,
                              width: view.bounds.width - 40,
                              height: 75)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
                  print("Missing fields")
                  return
              }
        
        authManager.signIn(withEmail: email, password: password) { [weak self] result in
            switch result {
            case .success(_):
                self?.dismiss(animated: true, completion: nil)
            case .failure(.signInFailedError):
                // present a modal with the error
                break
            }
        }
    }
    
}
