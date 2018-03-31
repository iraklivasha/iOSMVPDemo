//
//  AnimalGateway.swift
//  MVPDemo
//
//  Created by Irakli Vashakidze on 3/28/18.
//  Copyright © 2018 Bank Of Georgia. All rights reserved.
//

import Foundation

class ErrorObj : Error {
    private(set) var message: String
    init(message: String) {
        self.message = message
    }
}

struct Response<T> {
    var result: T?
    var error: ErrorObj?
}

protocol AnimalGateway {
    func loadAnimals(completion:(Response<[Animal]>)->Void)
}

class Animal {
    var title: String!
    var subTitle: String!
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}

class AnimalGatewayImpl: AnimalGateway {
    func loadAnimals(completion:(Response<[Animal]>)->Void) {
        let dataSource = [
            Animal(title: "Tiger", subTitle: "Tiger subtitle"),
            Animal(title: "Lion", subTitle: "Lion subtitle"),
            Animal(title: "Wolf", subTitle: "Wolf subtitle")
        ]
        
        let resp = Response(result: dataSource, error: nil)
        completion(resp)
    }
}
