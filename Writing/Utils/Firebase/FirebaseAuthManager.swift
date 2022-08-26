//
//  FirebaseAuthManager.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/25/22.
//
import FirebaseAuth

enum AuthError: Error {
    case signInFailedError
}

final class FirebaseAuthManager {
    
    static let shared = FirebaseAuthManager()
    
    private init() {}
    
    var auth: Auth = FirebaseAuth.Auth.auth()
    
    var isUserSignedIn: Bool {
        auth.currentUser != nil
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Result<Bool, AuthError>) -> () ) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(.failure(.signInFailedError))
            } else {
                completion(.success(true))
            }
        }
    }
    
}
