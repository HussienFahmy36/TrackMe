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
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder?
    var audioFilePath: URL!
    var savePath: URL?
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

    func record(savePath: URL) {
        self.savePath = savePath
        grantRecordPermission {[weak self] in
            guard let `self` = self else {return}
            self.startRecord()
        }
    }

    func stopRecord() {
        audioRecorder?.stop()
        audioRecorder = nil
        guard let path = savePath else {return}
        delegate?.recordSuccess(filePath: path.absoluteString)
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
        do {
            guard let path = savePath else {return}
            audioRecorder = try AVAudioRecorder(url: path, settings: settings)
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
