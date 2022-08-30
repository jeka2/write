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
    
    typealias data = DummyData
    
    static let shared = FirebaseDatabaseManager()
    
    private init() {}
    
    private let reference = Database.database().reference()
    
    func getInstance(of value: String, completion: @escaping () -> ()) {
        reference.child(value).observeSingleEvent(of: .value) { snapshot in
            print(snapshot)
        }
    }
    
    func createTitle(of value: String, completion: @escaping () -> ()) {
        let title = Title(titleName: "My first book",
                          plotPoints: ["First thing happens", "Second thing happens","Third thing happens"],
                          chapters: data.chapters.map { $0.uuid },
                          characters: data.characters.map { $0.uuid },
                          organizations: data.organizations.map { $0.uuid },
                          fictionalNames: data.fictionalNames.map { $0.uuid },
                          relationships: data.relationships.map { $0.uuid })
        do {
            let data = try FirebaseEncoder().encode(title)
            reference.child("titles").setValue(data)
        } catch {
            
        }
    }
    
    func createChapter(title: String) {
        let dummyChapter = Chapter(uuid: UUID.init(),
                                   name: "Chapter 4",
                                   text: "This is the text for chapter 4",
                                   appearingCharacters: [DummyData.characters[0].uuid, DummyData.characters[1].uuid],
                                   nextChapter: UUID.init(),
                                   summary: ["This happened", "This happened too"])
        do {
            let data = try FirebaseEncoder().encode(dummyChapter)
            reference.child("chapters").setValue(data)
        } catch {
            
        }
    }
    
    func createPlace() {
        let dummyPlace = Place(uuid: UUID.init(),
                               name: "Hogwarts",
                               appearsInChapter: [data.chapters[0].uuid])
        
        do {
            let data = try FirebaseEncoder().encode(dummyPlace)
            reference.child("places").setValue(data)
        } catch {
            
        }
        
    }
    
    func createCharacter() {
        let dummyCharacter = Character(uuid: UUID.init(),
                                       firstName: "Hermione",
                                       lastName: "Granger",
                                       middleName: nil,
                                       nickNames: nil,
                                       gender: .female,
                                       birthday: Date(),
                                       skills: ["magic", "girl power"],
                                       appearance: ["Long Hair", "Coat"],
                                       allegiances: data.organizations.map { $0.uuid },
                                       relationships: data.relationships.map { $0.uuid },
                                       ethnicity: "Human",
                                       flaws: ["Stuck-up", "Annoying"],
                                       strength: ["Strong magic"],
                                       arc: "She helps",
                                       background: "She has a backtround",
                                       goals: ["Defeat Voldemort"])
        
        do {
            let data = try FirebaseEncoder().encode(dummyCharacter)
            reference.child("characters").setValue(data)
        } catch {
            
        }
    }
    
    func createRelationship() {
        let dummyRelationship = Relationship(uuid: UUID.init(), participats: [data.characters[0].uuid, data.characters[1].uuid], relationshipImportance: .important, type: .enemy)
        
        do {
            let data = try FirebaseEncoder().encode(dummyRelationship)
            reference.child("relationships").setValue(data)
        } catch {
            
        }
    }
    
    func createOrganization() {
        let dummyOrganization = Organization(uuid: UUID.init(), name: "The Death Eaters", goals: ["Get Harry Potter", "Be Evil"], members: [data.characters[1].uuid])
        
        do {
            let data = try FirebaseEncoder().encode(dummyOrganization)
            reference.child("organizations").setValue(data)
        } catch {
            
        }
    }
    
    func createFictionalName() {
        let dummyFictionalName = FictionalName(uuid: UUID.init(), name: "Bumblewheat", description: "It's a plant")
        
        do {
            let data = try FirebaseEncoder().encode(dummyFictionalName)
            reference.child("fictionalNames").setValue([data])
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






