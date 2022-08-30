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
        typealias data = DummyData
        let object: [String: Any] = [
            "titleName": "s",
            "plotPoints": ["first thing happens", "second things happens", "third thing happens"],
            "chapters": [data.chapters.map{ $0.uuid }],
            "characters": [data.characters.map{ $0.uuid }],
            "organizations": [data.organizations.map { $0.uuid }],
            "fictionalNames": [data.fictionalNames.map { $0.uuid }]
        ]
        reference.child("titles").setValue(object)
    }
    
}
//
//master:
//    projects:
//        UUID:
//ProjectName:
//ProjectDescription:
//Titles: Title
//StartDate:
//
//title:
//    titleName: String
//Characters: [UUID]
//Places:
//Plotpoints:
//Chapters:
//
//characters:
//    UUID:
//Age:
//Nicknames:
//Skills
//Appearance
//Relationships:
//Ethnicity:
//Flaws:
//Strengths:
//Arc:
//Background:
//Goal:
//
//chapters:
//    UUID:
//sections: [UUID]
//summary: should be able to number
//
//sections:
//    UUID:
//    Text:
//
//subplots:
//    UUID:
//summaryInBulletPointForm:
//
//FictionalNames:
//    UUID:
//places:
//  UUID
//  name:
//  appearsIn: [Chapter]






