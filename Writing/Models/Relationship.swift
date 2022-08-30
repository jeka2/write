//
//  Relationship.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//
import Foundation

protocol RelationshipProtocol {
    var uuid: UUID { get }
}

enum RelationshipType: String, Codable {
    case ally = "ally"
    case enemy = "enemy"
}

enum RelationshipImportance: String, Codable {
    case important = "important"
    case somewhatImportant = "somewhatImportant"
}

struct Relationship {
    let uuid: UUID
    let participats: [RelationshipProtocol]
    let relationshipImportance: RelationshipImportance
    let type: RelationshipType
}
