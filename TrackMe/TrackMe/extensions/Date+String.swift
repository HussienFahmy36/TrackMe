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

    func getHourMinsAndSecs() -> String {
        let date = Date()// Aug 25, 2017, 11:55 AM
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date) //11
        let minute = calendar.component(.minute, from: date) //55
        let minuteString = (minute <= 10) ? "0\(minute)" : "\(minute)"
        return "\(hour):\(minuteString)"

    }
}
