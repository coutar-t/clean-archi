//
//  PizzaListRepositoryInput.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

public protocol PizzaListRepositoryInput: class {
    var output: PizzaListRepositoryOuput? { get set }
    func getPizza()
}
