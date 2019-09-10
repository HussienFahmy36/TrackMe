//
//  HomeCellViewModel.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
struct HomeCellViewModel {
    var category: Int!
    var noteDescription: String!
    init(record: NoteRecord) {
        category = record.category.rawValue
        noteDescription = record.text
    }

}
