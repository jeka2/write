//
//  Chapter.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 8/29/22.
//

import Foundation

struct Chapter {
    let uuid: UUID
    let sections: [UUID]
    let summary: [String] // string for bullet points
}
