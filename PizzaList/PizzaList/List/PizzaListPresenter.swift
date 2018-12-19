//
//  PizzaListPresenter.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

protocol PizzaListPresenterInput: class {
    func getPizzas()
}

protocol PizzaListInteractorOutput: class {
    func pizzaLoaded(pizza: [PizzaModel])
}

class PizzaListPresenter: PizzaListPresenterInput {
    weak var output: PizzaListPresenterOutput?
    var interactor: PizzaListInteractorInput!

    init(interactor: PizzaListInteractorInput) {
        self.interactor = interactor
    }

    func getPizzas() {
        interactor.loadPizzas()
    }
}

extension PizzaListPresenter: PizzaListInteractorOutput {
    func pizzaLoaded(pizza: [PizzaModel]) {
        output?.updateViewModel(viewModel: pizza.map({ $0.name }))
    }
}
