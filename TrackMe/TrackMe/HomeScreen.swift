//
//  ViewController.swift
//  TrackMe
//
//  Created by Hussien Gamal Mohammed on 8/18/19.
//  Copyright © 2019 vodafone. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let item = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = item
    }

    @objc func addTapped() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NewRecordScreen") else {return}
        navigationController?.pushViewController(vc, animated: true)

    }


}

