//
//  PizzaModel.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation
import Business

struct PizzaResponse: PizzaResponseProtocol {
    var name: String
    var isVeggie: Bool

    init(name: String, isVeggie: Bool) {
        self.name = name
        self.isVeggie = isVeggie
    }
}
