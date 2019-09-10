//
//  SpeechRecongnizer.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/29/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import Speech
class SpeechRecognizer {

    private let audioEngine = AVAudioEngine()
    private var inputNode: AVAudioInputNode?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    public weak var delegate: SpeechRecognizerDelegate? {
        didSet {
            configAudioSession()
            configMicrophoneInput()
            configRecognitionRequest()

        }
    }

    //MARK: - public methods
    init() {
    }

    public func recognize() {
        guard let recognitionRequest = recognitionRequest, let inputNode = inputNode else {
            return
        }
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) {[weak self] result, error in
            guard let self = self else {
                return
            }
            var isFinal = false
            if let result = result {
                // Update the text view with the results.
                self.delegate?.recognized(text: result.bestTranscription.formattedString)
                isFinal = result.isFinal
                print("Text \(result.bestTranscription.formattedString)")
            }

            if error != nil || isFinal {
                self.delegate?.failedRecognition(error: error!)
                // Stop recognizing speech if there is a problem.
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
            }
        }
    }

    func stopRecognize() {
        recognitionTask?.cancel()
    }


    //MARK: private methods
    private func configAudioSession() {
        // Configure the audio session for the app.
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            inputNode = audioEngine.inputNode
        }
        catch {
            delegate?.failedRecognition(error: error)
        }
    }

    private func configMicrophoneInput() {
        // Configure the microphone input.
        let recordingFormat = inputNode?.outputFormat(forBus: 0)
        inputNode?.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {[weak self] (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            guard let self = self else {
                return
            }
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        }
        catch {
            delegate?.failedRecognition(error: error)
        }
    }

    private func configRecognitionRequest() {
        // Create and configure the speech recognition request.
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
    }
}
