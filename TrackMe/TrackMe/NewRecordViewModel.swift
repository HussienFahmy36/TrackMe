//
//  NewRecordViewModel.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/19/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import UIKit

class NewRecordViewModel {

    private var audioRecorder = AudioRecorder()
    private let stopRecordIcName = "stopRecordIc"
    private let startRecordIcName = "startRecordIc"
    var isRecording = false
    var recordButtonImage : UIImage? {
        if !isRecording {
            return UIImage(named: startRecordIcName)
        }
            return UIImage(named: stopRecordIcName)
    }


    init() {
        audioRecorder.delegate = self
    }

    var recordText: String?
    var recordClipPath: String?


    func recordButtonClicked() {
        if !isRecording {
            startRecord()
            isRecording = true
        }
        else {
            stopRecord()
            isRecording = false
        }
    }

    func saveRecordClicked() {

    }

    //MARK:  - private methods

    private func startRecord() {
        audioRecorder.record()

    }

    private func stopRecord() {
        audioRecorder.stopRecord()
    }


}

// MARK - conform of AudioRecorderDelegate
extension NewRecordViewModel: AudioRecorderDelegate {
    func recordSuccess(filePath: String) {
        recordClipPath = filePath
    }

    func recordFailed(error: AudioRecorderError) {

    }


}
