//
//  AnimalDatasource.swift
//  MVPDemo
//
//  Created by Irakli Vashakidze on 3/28/18.
//  Copyright © 2018 Bank Of Georgia. All rights reserved.
//

import UIKit

class AnimalCellObj {
    var title: String!
    var subTitle: String!
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}

class AnimalDatasource : GenericDataSource<AnimalCellObj> {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AnimalTableViewCell
        if let animal = self.dataSource?[indexPath.section][indexPath.row] {
            cell.configure(title: animal.title, subTitle: animal.subTitle)
        }
        return cell
    }
}
