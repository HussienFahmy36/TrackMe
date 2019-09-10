//
//  String+RemoveSpecialChars.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 9/10/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation

extension String {
    func removeSpecialCharsFromString() -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_")
        return String(self.filter {okayChars.contains($0) })
    }
}
