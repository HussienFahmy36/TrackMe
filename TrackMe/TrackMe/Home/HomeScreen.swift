//
//  ViewController.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/18/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    var viewModel = HomeViewModel()
    @IBOutlet weak var notesTableView: UITableView!
    let cellHeight = 72

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let item = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = item
        notesTableView.dataSource = self
        notesTableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadCells()
        notesTableView.reloadData()
    }

    @objc func addTapped() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NewRecordScreen") else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - uitableviewdelegate

extension HomeScreen: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellsViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.layoutIfNeeded()
        cell.config(viewModel.cellsViewModel[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
}

