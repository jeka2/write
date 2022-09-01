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
            reference.child("titles/\(title.titleName)").setValue(data)
        } catch {
            
        }
    }
    
    func getTitles(completion: @escaping (Result<[Title], Error>) -> ()) {
        reference.child("titles").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let titles = try FirebaseDecoder().decode([Title].self, from: values)
                completion(.success(titles))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
            
        }
    }
    
    func createChapter(title: String) {
        let dummyChapter = Chapter(uuid: UUID.init(),
                                   name: "Chapter 4",
                                   text: "This is the text for chapter 4",
                                   appearingCharacters: [DummyData.characters[0].uuid, DummyData.characters[1].uuid],
                                   nextChapter: nil,
                                   summary: ["This happened", "This happened too"])
        guard let key = reference.child("chapters").childByAutoId().key else {
            return
        }
        
        do {
            let data = try FirebaseEncoder().encode(dummyChapter)
            reference.updateChildValues(["chapters/\(key)": data])
            reference.updateChildValues(["titles/My first book/chapters/\(key)": dummyChapter.uuid.uuidString])
        } catch {
            
        }
    }
    
    func getChapters(completion: @escaping (Result<[Chapter],Error>) -> ()) {
        reference.child("chapters").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let chapters = try FirebaseDecoder().decode([Chapter].self, from: values)
                completion(.success(chapters))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
            
        }
    }
    
    func createPlace() {
        let dummyPlace = Place(uuid: UUID.init(),
                               name: "Hogwarts",
                               appearsInChapter: [data.chapters[0].uuid])
        
        guard let key = reference.child("places").childByAutoId().key else {
            return
        }
        
        do {
            let data = try FirebaseEncoder().encode(dummyPlace)
            reference.updateChildValues(["places/\(key)": data])
            reference.updateChildValues(["titles/My first book/places/\(key)": dummyPlace.uuid.uuidString])
        } catch {
            
        }
        
    }
    
    func getPlaces(completion: @escaping (Result<[Place], Error>) -> ()) {
        reference.child("places").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let places = try FirebaseDecoder().decode([Place].self, from: values)
                completion(.success(places))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
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
        
        guard let key = reference.child("characters").childByAutoId().key else {
            return
        }
        
        do {
            let data = try FirebaseEncoder().encode(dummyCharacter)
            reference.updateChildValues(["characters/\(key)": data])
            reference.updateChildValues(["titles/My first book/characters/\(key)": dummyCharacter.uuid.uuidString])
        } catch {
             
        }
    }
    
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> ()) {
        reference.child("characters").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let characters = try FirebaseDecoder().decode([Character].self, from: values)
                completion(.success(characters))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
        }
    }
    
    func createRelationship() {
        let dummyRelationship = Relationship(uuid: UUID.init(), participats: [data.characters[0].uuid, data.characters[1].uuid], relationshipImportance: .important, type: .enemy)
        
        guard let key = reference.child("relationships").childByAutoId().key else {
            return
        }
        
        do {
            let data = try FirebaseEncoder().encode(dummyRelationship)
            reference.updateChildValues(["relationships/\(key)": data])
            reference.updateChildValues(["titles/My first book/relationships/\(key)": dummyRelationship.uuid.uuidString])
        } catch {
            
        }
        
    }
    
    func getRelationships(completion: @escaping (Result<[Relationship], Error>) -> ()) {
        reference.child("relationships").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let relationships = try FirebaseDecoder().decode([Relationship].self, from: values)
                completion(.success(relationships))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
        }
    }
    
    func createOrganization() {
        let dummyOrganization = Organization(uuid: UUID.init(), name: "The Death Eaters", goals: ["Get Harry Potter", "Be Evil"], members: [data.characters[1].uuid])
        
        guard let key = reference.child("organizations").childByAutoId().key else {
            return
        }
        
        do {
            let data = try FirebaseEncoder().encode(dummyOrganization)
            reference.updateChildValues(["organizations/\(key)": data])
            reference.updateChildValues(["titles/My first book/organizations/\(key)": dummyOrganization.uuid.uuidString])
        } catch {
            
        }
    }
    
    func getOrganizations(completion: @escaping (Result<[Organization], Error>) -> ()) {
        reference.child("organizations").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let organizations = try FirebaseDecoder().decode([Organization].self, from: values)
                completion(.success(organizations))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
        }
    }
    
    func createFictionalName() {
        let dummyFictionalName = FictionalName(uuid: UUID.init(), name: "Bumblewheat", description: "It's a plant")
        
        guard let key = reference.child("fictionalNames").childByAutoId().key else {
            return
        }
        
        do {
            let data = try FirebaseEncoder().encode(dummyFictionalName)
            reference.updateChildValues(["fictionalNames/\(key)": data])
            reference.updateChildValues(["titles/My first book/fictionalNames/\(key)": dummyFictionalName.uuid.uuidString])
        } catch {
            
        }
    }
    
    func getFictionalNames(completion: @escaping (Result<[FictionalName], Error>) -> ()) {
        reference.child("fictionalNames").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else { return }
            let values = value.map { $0.value }
            do {
                let fictionalNames = try FirebaseDecoder().decode([FictionalName].self, from: values)
                completion(.success(fictionalNames))
            } catch {
                completion(.failure(FirebaseErrors.decodingError))
            }
        }
    }
    
}






