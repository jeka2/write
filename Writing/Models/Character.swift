//
//  Character.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//

import Foundation

enum Gender: String, Codable {
    case male = "male"
    case female = "female"
    case other = "other"
}

struct Character: Codable {
    let uuid: UUID
    let firstName: String
    let lastName: String
    let middleName: String?
    let nickNames: [String]?
    let gender: Gender
    let birthday: Date
    let skills: [String]
    let appearance: [String]
    let allegiances: [Organization]
    let relationships: [Relationship]
    let ethnicity: String
    let flaws: [String]
    let strength: [String]
    let arc: String
    let background: String
    let goals: [String]
}

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
