//
//  HomeCell.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var cellCategoryView: NoteCategoryView!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    func config(_ viewModel: HomeCellViewModel) {
        cellDescription.text = viewModel.noteDescription
        cellCategoryView.config(NoteCateogoryViewModel(category: NoteCategory(rawValue: viewModel.category)))
        cellDate.text = viewModel.hour
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cellCategoryView.layoutSubviews()
    }
}
