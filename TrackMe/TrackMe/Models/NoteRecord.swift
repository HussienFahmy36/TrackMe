//
//  NoteRecord.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/21/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
class NoteRecord: Object {
    @objc dynamic var path = ""
    @objc dynamic var category: NoteCategory = .other
    @objc dynamic var text = ""
    @objc dynamic let date = Date()
    init(path: String, category: NoteCategory, text: String) {
        super.init()
        self.path = path
        self.category = category
        self.text = text
    }

    required init() {
        super.init()
        path = ""
        category = .other
        text = ""
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }

    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }

}
