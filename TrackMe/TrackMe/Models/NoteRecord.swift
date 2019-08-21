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
    @objc dynamic var category = 0
    @objc dynamic var text = ""
    init(path: String, category: Int, text: String) {
        super.init()
        self.path = path
        self.category = category
        self.text = text
    }

    required init() {
        super.init()
        path = ""
        category = 0
        text = ""
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }

    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }

}
