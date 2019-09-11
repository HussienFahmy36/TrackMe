//
//  HomeViewModel.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/24/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import Foundation
class HomeViewModel {
    let dbManager = DBCacheManager()

    var currentDate = Date()
    var currentDateString: String {
        return currentDate.asString(style: .long).removeSpecialCharsFromString()
    }
    var sectionsData: [(Date, [HomeCellViewModel])] = []
    init() {
        loadCells()
    }

    func loadCells() {
        var cellsViewModel: [HomeCellViewModel] = []
        let results = dbManager.load(with: currentDate)
        for note in results where note is NoteRecord {
            guard let note = note as? NoteRecord else {
                return
            }
            let vm = HomeCellViewModel(record: note)
            cellsViewModel.append(vm)
        }

        if cellsViewModel.count > 0 {
            let sectionIndex = sectionsData.firstIndex(where: {$0.0 == currentDate})
            if cellsViewModel.count > 0 {
                if  sectionIndex == nil {
                    sectionsData.append((currentDate, cellsViewModel))
                }
                else {
                    sectionsData[sectionIndex!].1.removeAll()
                    sectionsData[sectionIndex!].1.append(contentsOf: cellsViewModel)
                }
            }

        }
    }

    func goBackOneDay() {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        loadCells()
    }
}
