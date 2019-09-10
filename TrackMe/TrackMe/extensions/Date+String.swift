//
//  Date+String.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 9/10/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
}
