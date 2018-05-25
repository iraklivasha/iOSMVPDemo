//
//  AnimalDatasource.swift
//  MVPDemo
//
//  Created by Irakli Vashakidze on 3/28/18.
//  Copyright © 2018 Bank Of Georgia. All rights reserved.
//

import UIKit

class GenericDataSource<T> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private(set) var dataSource: [[T]]?
    
    override init() {
        super.init()
    }
    
    init(with dataSource: [T]) {
        super.init()
        self.configure(with: dataSource)
    }
    
    init(with dataSource: [[T]]) {
        super.init()
        self.configure(with: dataSource)
    }
    
    func configure(with dataSource: [[T]]) {
        self.dataSource = dataSource
    }
    
    func configure(with dataSource: [T]) {
        self.dataSource = [dataSource]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
