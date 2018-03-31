//
//  AnimalTableViewCell.swift
//  MVPDemo
//
//  Created by Irakli Vashakidze on 3/28/18.
//  Copyright © 2018 Bank Of Georgia. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    func configure(title: String, subTitle: String) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
    }
    
}
