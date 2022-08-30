//
//  Relationship.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//
import Foundation

enum RelationshipType: String, Codable {
    case ally = "ally"
    case enemy = "enemy"
}

enum RelationshipImportance: String, Codable {
    case important = "important"
    case somewhatImportant = "somewhatImportant"
}

struct Relationship: Codable {
    let uuid: UUID
    let participats: [UUID]
    let relationshipImportance: RelationshipImportance
    let type: RelationshipType
}
