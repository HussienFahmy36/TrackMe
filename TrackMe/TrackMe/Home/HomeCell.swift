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

    @IBOutlet weak var cellCategory: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    
    var viewModel: HomeCellViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
