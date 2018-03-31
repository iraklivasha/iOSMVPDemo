//
//  AnimalsPresenter.swift
//  MVPDemo
//
//  Created by Irakli Vashakidze on 3/28/18.
//  Copyright © 2018 Bank Of Georgia. All rights reserved.
//

import Foundation

protocol AnimalsPresenter {
    
    var dataSource: AnimalDatasource { get }
    
    func configure(for view: AnimalView)
    func reload()
}

protocol AnimalView: class {
    func refresh()
    func handleError(error: String)
}

class AnimalsPresenterImpl: AnimalsPresenter {
    
    private var gateway: AnimalGateway = AnimalGatewayImpl()
    weak var animalView: AnimalView?
    
    private var _dataSource = AnimalDatasource()
    
    func configure(for view: AnimalView) {
        self.animalView = view
        self.reload()
    }
    
    func reload() {
        self.gateway.loadAnimals { [weak self] (resp) in
            DispatchQueue.main.async {
                if let e = resp.error {
                    self?.animalView?.handleError(error: e.message)
                } else {
                    
                    var cellObjs = [AnimalCellObj]()
                    for obj in resp.result! {
                        cellObjs.append(AnimalCellObj(title: obj.title, subTitle: obj.subTitle))
                    }
                    
                    self?._dataSource.configure(with: cellObjs)
                    self?.animalView?.refresh()
                }
            }
        }
    }
    
    var dataSource: AnimalDatasource {
        get {
            return _dataSource
        }
    }
}
