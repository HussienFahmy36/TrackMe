//
//  HomeViewModel.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
struct HomeViewModel {
    let dbManager = DBCacheManager()

    var currentDate = Date()
    var currentDateString: String {
        return currentDate.asString(style: .short).removeSpecialCharsFromString()
    }

    var cellsViewModel: [HomeCellViewModel] = []
    var sectionsData: [(Int, [HomeCellViewModel])] = []
    init() {
        loadCells()
    }

    mutating func loadCells() {
        cellsViewModel = []
        let results = dbManager.loadAll(date: currentDateString)
        results.forEach({
            guard let note = $0 as? NoteRecord else {
                return
            }
            let vm = HomeCellViewModel(record: note)
            cellsViewModel.append(vm)

        })
    }

    private func filterResultsByDate() {


    }
}
