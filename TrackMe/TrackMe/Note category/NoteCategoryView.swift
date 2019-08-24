//
//  NoteCategoryView.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import UIKit

class NoteCategoryView: UIView {

    var styleColor: UIColor?
    let label = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
        initLabel()
    }

    func config(_ viewModel: NoteCateogoryViewModel) {
        switch viewModel.category {
        case .work?:
            styleColor = .blue
            label.text = "Work"
        case .lifeStyle?:
            styleColor = .green
            label.text = "Life style"
        case .other?:
            styleColor = .red
            label.text = "Other"
        default:
            break
        }
        applyStyle()
    }

    func initLabel() {
        label.textColor = .clear
        label.center = center
        label.frame = frame
        label.textAlignment = .center
        addSubview(label)

    }

    func applyStyle() {
        layer.borderWidth = 1
        layer.borderColor = styleColor?.cgColor
        layer.cornerRadius = 5
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        label.textColor = styleColor ?? .clear
    }
}
