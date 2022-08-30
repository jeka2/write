//
//  Title.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/30/22.
//

import Foundation

struct Title: Codable {
    let titleName: String
    let plotPoints: [String]
    let chapters: [UUID]
    let characters: [UUID]
    let organizations: [UUID]
    let fictionalNames: [UUID]
    let relationships: [UUID]
}
