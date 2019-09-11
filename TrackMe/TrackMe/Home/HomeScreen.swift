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
    let headerHeight = 60

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

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.sectionsData.count > 0 {
            return viewModel.sectionsData[section].1.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.layoutIfNeeded()
        let viewModelCell = viewModel.sectionsData[indexPath.section].1[indexPath.row]
        cell.config(viewModelCell)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForSection = UIView(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width), height: headerHeight))
        viewForSection.backgroundColor = .clear
        let label = UILabel(frame: CGRect(x: 30, y: 0, width: tableView.frame.width, height: CGFloat(headerHeight)))
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        if viewModel.sectionsData.count > 0 {
            let date = viewModel.sectionsData[section].0
            label.text = date.asString(style: .medium)
            viewForSection.addSubview(label)
        }
        return viewForSection
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.section == viewModel.sectionsData.count - 1 &&
//            indexPath.row == viewModel.sectionsData[indexPath.section].1.count - 1{
//            viewModel.goBackOneDay()
//            tableView.reloadData()
//        }
    }
}

