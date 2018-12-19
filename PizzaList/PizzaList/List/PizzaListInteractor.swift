//
//  PizzaListInteractor.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

protocol PizzaListInteractorInput: class {
    func loadPizzas()
}

protocol PizzaListRepositoryOuput: class {
    func receivedPizzas(with pizzas: [PizzaModel])
}

class PizzaListInteractor: PizzaListInteractorInput {
    weak var interactorOutput: PizzaListInteractorOutput?
    var repositoryInput: PizzaListRepositoryInput!

    init(repository: PizzaListRepositoryInput) {
        self.repositoryInput = repository
    }

    func loadPizzas() {
        repositoryInput.getPizza()
    }
}

extension PizzaListInteractor: PizzaListRepositoryOuput {
    func receivedPizzas(with pizzas: [PizzaModel]) {
        interactorOutput?.pizzaLoaded(pizza: pizzas)
    }
}
