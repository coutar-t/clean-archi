//
//  PizzaListRepository.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation
import Business

class PizzaListRepository: PizzaListRepositoryInput {
    var pizzas = [
        PizzaResponse(name: "Margarita", isVeggie: false),
        PizzaResponse(name: "Hawaienne", isVeggie: true),
        PizzaResponse(name: "Savoyarde", isVeggie: false)
    ]
    weak var output: PizzaListRepositoryOuput?

    init() {
    }


    func getPizza() {
        output?.receivedPizzas(with: pizzas)
    }
}
