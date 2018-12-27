//
//  PizzaListInteractor.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

class PizzaListInteractor: PizzaListInteractorInput {
    weak var output: PizzaListInteractorOutput?
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
        output?.pizzaLoaded(pizza: pizzas.map({ PizzaDataModel(name: $0.name, isVeggie: $0.isVeggie) }))
    }
}
