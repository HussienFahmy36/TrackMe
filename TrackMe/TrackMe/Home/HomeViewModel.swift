//
//  HomeViewModel.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
struct HomeViewModel {
    var cellsViewModel: [HomeCellViewModel] = []
    init() {
        loadCells()
    }

    mutating func loadCells() {
        let vm = HomeCellViewModel(category: 0, noteDescription: "test")
        cellsViewModel.append(vm)
    }
}
