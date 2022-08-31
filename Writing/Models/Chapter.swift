//
//  Chapter.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//

import Foundation

struct Chapter: Codable {
    let uuid: UUID
    let name: String
    let text: String
    let appearingCharacters: [UUID]
    let nextChapter: UUID?
    let summary: [String] // string for bullet points
}

struct ChapterDummy: Codable {
    let uuid: String
    let name: String
    let text: String
    let appearingCharacters: [String]
    let nextChapter: String?
    let summary: [String] // string for bullet points
}
