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
        let sections = [ChapterSection(uuid: UUID.init(), text: "Something"), ChapterSection(uuid: UUID.init(), text: "Something 2"), ChapterSection(uuid: UUID.init(), text: "Something 3")]
        let sections2 = [ChapterSection(uuid: UUID.init(), text: "Something"), ChapterSection(uuid: UUID.init(), text: "Something 2"), ChapterSection(uuid: UUID.init(), text: "Something 3")]
        let chapter1 = Chapter(uuid: UUID.init(), sections: sections.map({ $0.uuid }), summary: ["This happened", "Then this happened", "Then the third thing happened"])
        let chapter2 = Chapter(uuid: UUID.init(), sections: sections2.map({ $0.uuid }), summary: ["This happened", "Then this happened", "Then the third thing happened"])
        let object: [String: Any] = [
            "titleName": "s",
            "plotPoints": [],
            "chapters": [chapter1, chapter2],
            
            
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






