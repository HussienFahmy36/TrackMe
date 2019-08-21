//
//  NewRecordScreen.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/18/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import UIKit

class NewRecordScreen: UIViewController {

    let viewModel = NewRecordViewModel()
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add note"
        recordButton.setImage(viewModel.recordButtonImage, for: .normal)
    }
    

    @IBAction func startRecording(_ sender: Any) {
        viewModel.recordButtonClicked()
        recordButton.setImage(viewModel.recordButtonImage, for: .normal)
    }

    @IBAction func saveNote(_ sender: Any) {
        viewModel.saveRecordClicked()
    }
}
