//
//  FirebaseDatabaseManager.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/25/22.
//

import FirebaseDatabase

class FirebaseDatabaseManager {
    
    static let shared = FirebaseDatabaseManager()
    
    private init() {}
    
    private let reference = Database.database().reference()
    
    func getInstance(of value: String, completion: @escaping () -> ()) {
        reference.child(value).observeSingleEvent(of: .value) { snapshot in
            print(snapshot)
        }
    }
    
    func setInstance(of value: String, completion: @escaping () -> ()) {
        let object: [String: Any] = [
            "name": "iOS Academy" as NSObject,
            "Youtube": "yes"
        ]
        reference.child(value).setValue(object)
    }
    
}
