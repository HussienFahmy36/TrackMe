//
//  AudioRecorder.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/19/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import AVFoundation

enum AudioRecorderError: Error {
    case failSave
    case failToRecord
    case ungrantedPermission
    case cancled
}

class AudioRecorder: NSObject {

    weak var delegate: AudioRecorderDelegate?
    let filesManager = FilesManager()
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder?
    let settings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 12000,
        AVNumberOfChannelsKey: 1,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]


    override init() {
        super.init()
        recordingSession = AVAudioSession.sharedInstance()
    }

    func record() {
        grantRecordPermission {[weak self] in
            guard let `self` = self else {return}
            self.startRecord()
        }
    }

    func stopRecord() {
        audioRecorder?.stop()
        audioRecorder = nil
        let dir = filesManager.getDocumentsDirectory()
        let audioFilename = dir.appendingPathComponent("recording.m4a")
        delegate?.recordSuccess(filePath: audioFilename.absoluteString)
        print("Saved in \(audioFilename)")
    }

    //MARK: internal methods

    private func grantRecordPermission(completion: @escaping () -> ()) {
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [weak self] allowed in
                guard let `self` = self else {return}
                if allowed {
                    completion()
                } else {
                    // failed to record!
                    self.delegate?.recordFailed(error: .ungrantedPermission)
                }
            }
        } catch {
            // failed to record!
            self.delegate?.recordFailed(error: .failToRecord)
        }
    }

    private func startRecord() {
        let dir = filesManager.getDocumentsDirectory()
        let audioFilename = dir.appendingPathComponent("recording.m4a")
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
        }
    }
}

extension AudioRecorder: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
        }
    }

}
