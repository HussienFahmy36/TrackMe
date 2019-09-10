//
//  SpeechRecognizerDelegate.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/29/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation

protocol SpeechRecognizerDelegate: class {
    func recognized(text: String)
    func failedRecognition(error: Error)

}
