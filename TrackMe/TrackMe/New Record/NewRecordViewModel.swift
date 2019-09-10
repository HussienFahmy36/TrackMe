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
    private let dbManager = DBManagerRealm()
    private let audioRecognizer = SpeechRecognizer()
    private let stopRecordIcName = "stopRecordIc"
    private let startRecordIcName = "startRecordIc"
    private var noteText: String = "test"
    private var noteCategory: NoteCategory = .other
    public let cateogires: [Int] = [NoteCategory.work.rawValue, NoteCategory.lifeStyle.rawValue, NoteCategory.other.rawValue]
    var isRecording = false
    var recordButtonImage : UIImage? {
        if !isRecording {
            return UIImage(named: startRecordIcName)
        }
            return UIImage(named: stopRecordIcName)
    }


    init() {
        audioRecorder.delegate = self
        audioRecognizer.delegate = self
    }

    var recordText: String?
    var recordClipPath: String?


    func recordButtonClicked() {
        if !isRecording {
//            startRecord()
            startRecognition()
            isRecording = true
        }
        else {
//            stopRecord()
            stopRecognition()
            isRecording = false
        }
    }

    func noteText(text: String) {
        noteText = text
    }

    func categorySelected(index: Int) {
        noteCategory = NoteCategory(rawValue: index) ?? .other
    }

    func saveRecordClicked() {
        let record = NoteRecord(path: recordClipPath ?? "", category: noteCategory, text: noteText)
        dbManager.store(note: record)

    }

    //MARK:  - private methods
    private func startRecognition() {
        audioRecognizer.recognize()
    }

    func stopRecognition() {
        audioRecognizer.stopRecognize()
    }

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

// MARK - conform of SpeechRecognition
extension NewRecordViewModel: SpeechRecognizerDelegate {
    func recognized(text: String) {
        print(text)
    }

    func failedRecognition(error: Error) {
        print("error")
    }

}




