//
//  FirebaseDatabaseManager.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/25/22.
//

import CodableFirebase
import FirebaseDatabase
import Foundation

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
            "titleName": "My First Book",
            "plotPoints": ["first thing happens", "second things happens", "third thing happens"],
            "chapters": [data.chapters.map{ $0.uuid.uuidString }],
            "characters": [data.characters.map{ $0.uuid.uuidString }],
            "organizations": [data.organizations.map { $0.uuid.uuidString }],
            "fictionalNames": [data.fictionalNames.map { $0.uuid.uuidString }],
            "relationships": [data.relationships.map { $0.uuid.uuidString }]
        ]
        reference.child("titles").setValue(object)
    }
    
    func createChapter(title: String) {
        let dummyChapter = Chapter(uuid: UUID.init(), name: "Chapter 4", text: "This is the text for chapter 4", appearingCharacters: [DummyData.characters[0].uuid, DummyData.characters[1].uuid], nextChapter: UUID.init(), summary: ["This happened", "This happened too"])
        do {
            let data = try FirebaseEncoder().encode(dummyChapter)
        } catch {
            
        }
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






