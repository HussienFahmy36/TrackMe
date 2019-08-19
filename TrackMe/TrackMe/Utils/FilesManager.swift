//
//  FilesManager.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/19/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
struct FilesManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
