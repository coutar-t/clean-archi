//
//  PizzaListPresenter.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation
import Business

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
    func pizzaLoaded(pizza: [PizzaItemProtocol]) {
        let cells: [PizzaCellViewModel] = pizza.compactMap({ PizzaCellViewModel(name: $0.name, color: $0.isVeggie ? .Green : .None) })
        let pizzaViewModel = PizzaListViewModel(title: "Pizza Menu", pizzaCells: cells)
        output?.updateViewModel(viewModel: pizzaViewModel)
    }
}
