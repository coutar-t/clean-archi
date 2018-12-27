//
//  PizzaListInteractorInput.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

public protocol PizzaListInteractorInput: class {
    var output: PizzaListInteractorOutput? { get set }
    func loadPizzas()
}
