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
    private let filesManager = FilesManager()
    private let dbManager = DBManager()
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
        let record = NoteRecord(path: recordClipPath ?? "", category: 0, text: "hi")
        dbManager.store(note: record)

    }

    //MARK:  - private methods

    private func startRecord() {
        audioRecorder.record(savePath: filesManager.createNewFile(ext: "m4a"))

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
