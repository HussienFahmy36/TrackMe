//
//  DBManager.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/21/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import RealmSwift
struct DBManagerRealm: DBManagerProtocol {
    func store(note: Any) {
        if let note = note as? Object {
        let realm = try! Realm()
        try! realm.write {
            realm.add(note)
            }
        }
    }
}
