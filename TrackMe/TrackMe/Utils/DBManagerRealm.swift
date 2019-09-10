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


    init() {
        configure()
    }
    
    func configure() {
        var config = Realm.Configuration()
        let trackMeDBName = "DBTrackMe"
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(trackMeDBName).realm")
        Realm.Configuration.defaultConfiguration = config
        print("DB URL : \(config.fileURL!.absoluteString)")

    }

    func store(note: Any) {
        if let note = note as? Object {
        let realm = try! Realm()
        try! realm.write {
            realm.add(note)
            }
        }
    }

    func loadAll() -> [Any] {
        let realm = try! Realm()
        let notes = realm.objects(NoteRecord.self)
        return notes.map({$0})
    }
}
