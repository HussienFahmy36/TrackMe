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
    @IBOutlet weak var noteCategoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add note"
        recordButton.setImage(viewModel.recordButtonImage, for: .normal)
        noteCategoryCollectionView.delegate = self
        noteCategoryCollectionView.dataSource = self
    }
    

    @IBAction func startRecording(_ sender: Any) {
        viewModel.recordButtonClicked()
        recordButton.setImage(viewModel.recordButtonImage, for: .normal)
    }

    @IBAction func saveNote(_ sender: Any) {
        viewModel.saveRecordClicked()
    }
}

// MARK: - collectionView delegate
extension NewRecordScreen: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cateogires.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteCateogoryCell", for: indexPath) as? NoteCateogryCell
            else {
                return UICollectionViewCell()
        }
        guard let category = NoteCategory(rawValue: viewModel.cateogires[indexPath.row]) else {
            return UICollectionViewCell()
        }
        cell.config(category)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.categorySelected(index: indexPath.row)
    }
}
