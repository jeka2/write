//
//  Organization.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//

import Foundation

struct Organization: Codable {
    let uuid: UUID
    let name: String
    let goals: [String]
    let relationships: [Relationship]
    let members: [Character]
}
