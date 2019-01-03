//
//  PizzaListPresenterTests.swift
//  PizzaListTests
//
//  Created by Thibaut Coutard on 01/01/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Business
@testable import PizzaList

class PizzaListPresenterTests: XCTestCase {
    var interactor: PizzaListInteractorInputMock!
    var sut: PizzaListPresenter!

    override func setUp() {
        interactor = PizzaListInteractorInputMock()
        sut = PizzaListPresenter(interactor: interactor)
    }


    func test_PizzaListPresenter_GetPizzas_CallsLoadPizzas() {
        sut.getPizzas()
        XCTAssertTrue(interactor.isLoadPizzasCalled)
    }

    func test_PizzaListPresenter_PizzaLoaded_updateViewModelIsCalled() {
        let output = PizzaListPresenterOutputMock()
        sut.output = output

        sut.pizzaLoaded(pizza: [])
        XCTAssertTrue(output.isUpdateViewModelCalled)
    }

    func test_PizzaListPresenter_PizzaLoaded_updateViewModelWithPizzas() {
        let output = PizzaListPresenterOutputMock()
        sut.output = output

        let firstPizza = PizzaItemMock(name: "first", isVeggie: true)
        let secondPizza = PizzaItemMock(name: "second", isVeggie: false)

        sut.pizzaLoaded(pizza: [firstPizza, secondPizza])
        XCTAssertEqual(output.viewModel.title, "Pizza Menu")
        XCTAssertEqual(output.viewModel.pizzaCells.first, firstPizza.asCell())
        XCTAssertEqual(output.viewModel.pizzaCells.last, secondPizza.asCell())
        XCTAssertEqual(output.viewModel.pizzaCells.count, 2)
    }

    func test_PizzaListPresenter_PizzaLoaded_updateViewModelWithPizzasColor() {
        let output = PizzaListPresenterOutputMock()
        sut.output = output

        let firstPizza = PizzaItemMock(name: "first", isVeggie: true)
        let secondPizza = PizzaItemMock(name: "second", isVeggie: false)

        sut.pizzaLoaded(pizza: [firstPizza, secondPizza])
        XCTAssertEqual(output.viewModel.pizzaCells.first?.color, .Green)
        XCTAssertEqual(output.viewModel.pizzaCells.last?.color, .None)
    }
}

extension PizzaCellViewModel: Equatable {
    public static func == (lhs: PizzaCellViewModel, rhs: PizzaCellViewModel) -> Bool {
        return lhs.name == rhs.name
    }
}

struct PizzaItemMock: PizzaItemProtocol {
    var name: String
    var isVeggie: Bool

    func asCell() -> PizzaCellViewModel {
        return PizzaCellViewModel(name: name, color: .Green)
    }
}

class PizzaListPresenterOutputMock: PizzaListPresenterOutput {
    var viewModel: PizzaListViewModel!
    var isUpdateViewModelCalled: Bool = false

    func updateViewModel(viewModel: PizzaListViewModel) {
        self.viewModel = viewModel
        self.isUpdateViewModelCalled = true
    }
}

class PizzaListInteractorInputMock: PizzaListInteractorInput {
    var output: PizzaListInteractorOutput?
    var isLoadPizzasCalled: Bool = false

    func loadPizzas() {
        isLoadPizzasCalled = true
    }
}


