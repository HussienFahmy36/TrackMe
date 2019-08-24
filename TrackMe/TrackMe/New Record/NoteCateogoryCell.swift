//
//  NoteCateogoryCell.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/22/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import UIKit

class NoteCateogryCell: UICollectionViewCell {
    
    @IBOutlet weak var noteCategory: NoteCategoryView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    func config(_ category: NoteCategory) {
        let viewModel = NoteCateogoryViewModel(category: category)
        noteCategory.config(viewModel)
    }
}
