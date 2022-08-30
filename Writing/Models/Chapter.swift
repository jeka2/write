//
//  Chapter.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//

import Foundation

struct Chapter {
    let uuid: UUID
    let name: String
    let sections: [UUID]
    let appearingCharacters: [Character]
    let summary: [String] // string for bullet points
}
