//
//  NoteCategoryView.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import UIKit

class NoteCategoryView: UIView {

    let label = UILabel()
    var styleColor: UIColor?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override func awakeFromNib() {
        super.awakeFromNib()
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
        setNeedsLayout()
        applyStyle()
    }

    func initLabel() {
        label.textColor = .clear
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        label.textAlignment = .center
        addSubview(label)
    }

    func applyStyle() {
        backgroundColor = styleColor ?? .clear
        layer.cornerRadius = 5
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        label.textColor = .white
    }

}
