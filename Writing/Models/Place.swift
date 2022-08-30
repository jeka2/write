//
//  Places.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//

import Foundation

struct Place: Codable {
    let uuid: UUID
    let name: String
    let appearsIn: [Chapter]
}
