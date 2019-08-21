//
//  DBManager.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/21/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import RealmSwift
struct DBManager {
    func store(note: NoteRecord) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(note)
        }
    }
}
