//
//  DBCacheManager.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 9/10/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import Disk

struct DBCacheManager: DBManagerProtocol {
    func store(note: Any) {
        if !noteDateExist(note: note) {
            save(note: note)
        }
        else {
            append(note: note)
        }
    }

    func load(with date: Date) -> [Any] {
        let fileName =  "\(date.asString(style: .short).removeSpecialCharsFromString()).json"
        do {
            let result = try Disk.retrieve(fileName, from: .caches, as: [NoteRecord].self)
            return result
        } catch {
            print("Error while retriving data for date, \(date)")
        }
        return []
    }

    private func save(note: Any)  {
        guard let noteRecord = note as? NoteRecord else {
            return
        }
        let fileName =  "\(noteRecord.dateString.removeSpecialCharsFromString()).json"
        do {
            print ("cache file path: \(try! Disk.url(for: fileName, in: .caches))")
            try Disk.save([noteRecord], to: .caches, as: fileName)
        } catch {
            print("Caching failed")
        }
    }

    private func append(note: Any) {
        guard let noteRecord = note as? NoteRecord else {
            return
        }
        let fileName =  "\(noteRecord.dateString.removeSpecialCharsFromString()).json"
        do {
            try Disk.append([noteRecord], to: fileName, in: .caches)
        } catch {
            print("adding failed")
        }
    }

    private func noteDateExist(note: Any) -> Bool {
        guard let noteRecord = note as? NoteRecord else {
            return true
        }
        let fileName =  "\(noteRecord.dateString.removeSpecialCharsFromString()).json"
        do {
            let results = try Disk.retrieve(fileName, from: .caches, as: [NoteRecord].self)
            return results.count > 0
        } catch {
            return false
        }
    }

    
}
