//
//  NoteRecord.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/21/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
struct NoteRecord: Codable {
    var path = ""
    var category: NoteCategory = .other
    var text = ""
    let dateString: String  = Date().asString(style: .short)

    init(path: String, category: NoteCategory, text: String) {
        self.path = path
        self.category = category
        self.text = text
    }
}
