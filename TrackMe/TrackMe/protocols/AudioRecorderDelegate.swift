//
//  AudioRecorderDelegate.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/19/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

protocol AudioRecorderDelegate: class {
    func recordSuccess(filePath: String)
    func recordFailed(error: AudioRecorderError)
}
