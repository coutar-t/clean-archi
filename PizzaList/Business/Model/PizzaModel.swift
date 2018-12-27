//
//  PizzaModel.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

public struct PizzaModel {
    var name: String
    var isVeggie: Bool

    public init(name: String, isVeggie: Bool) {
        self.name = name
        self.isVeggie = isVeggie
    }
}
