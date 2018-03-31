//
//  ViewController.swift
//  MVPDemo
//
//  Created by Irakli Vashakidze on 3/28/18.
//  Copyright © 2018 Bank Of Georgia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AnimalView {

    @IBOutlet private weak var tableView: UITableView!
    var presenter: AnimalsPresenter? = AnimalsPresenterImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.configure(for: self)
        self.tableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self.presenter?.dataSource
        self.tableView.delegate = self.presenter?.dataSource
    }

    func handleError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        self.show(alert, sender: alert)
    }
    
    func refresh() {
        self.tableView.reloadData()
    }
}

