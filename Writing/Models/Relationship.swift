//
//  Relationship.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//
import Foundation

enum RelationshipType: String, Codable {
    case friend = "friend"
    case enemy = "enemy"
}

struct Relationship {
    let uuid: UUID
    let type: RelationshipType
}
