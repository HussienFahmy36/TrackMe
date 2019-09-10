//
//  DBManagerProtocol.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/22/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
protocol DBManagerProtocol {
    func store(note: Any)
    func loadAll(date: String) -> [Any]
}
