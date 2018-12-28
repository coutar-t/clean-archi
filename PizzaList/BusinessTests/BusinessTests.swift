//
//  BusinessTests.swift
//  BusinessTests
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import XCTest
@testable import Business

class BusinessTests: XCTestCase {

    var sut: PizzaListInteractor!
    fileprivate var mockRepository: PizzaListRepositoryInputMock!

    override func setUp() {
        mockRepository = PizzaListRepositoryInputMock()
        sut = PizzaListInteractor(repository: mockRepository)
    }

    func test_PizzaListInteractor_LoadPizza_CallsRepository() {
        sut.loadPizzas()
        XCTAssertTrue(mockRepository.getPizzaCalled)
    }

    func test_PizzaListInteractor_ReceivedPizzas_CallsOutput() {
        let mockOutput = PizzaListInteractorOutputMock()
        sut.output = mockOutput

        sut.receivedPizzas(with: [])
        XCTAssertTrue(mockOutput.pizzaLoadedCalled)
    }

    func test_PizzaListInteractor_ReceivedPizza_CallsOutputsWithPizzas() {
        let mockOutput = PizzaListInteractorOutputMock()
        sut.output = mockOutput

        let firstPizza = PizzaResponse(name: "First", isVeggie: true)
        let secondPizza = PizzaResponse(name: "Second", isVeggie: false)

        sut.receivedPizzas(with: [firstPizza, secondPizza])
        XCTAssertEqual(PizzaResponse(from: mockOutput.pizzaLoaded.first!), firstPizza)
        XCTAssertEqual(PizzaResponse(from: mockOutput.pizzaLoaded.last!), secondPizza)
        XCTAssertEqual(mockOutput.pizzaLoaded.count, 2)
    }
}

fileprivate struct PizzaResponse: PizzaResponseProtocol, Equatable {
    var name: String
    var isVeggie: Bool

    init(name: String, isVeggie: Bool) {
        self.name = name
        self.isVeggie = isVeggie
    }

    init(from item: PizzaItemProtocol) {
        self.name = item.name
        self.isVeggie = item.isVeggie
    }
}

fileprivate class PizzaListInteractorOutputMock: PizzaListInteractorOutput {
    var pizzaLoadedCalled = false
    var pizzaLoaded: [PizzaItemProtocol] = []

    func pizzaLoaded(pizza: [PizzaItemProtocol]) {
        pizzaLoadedCalled = true
        pizzaLoaded = pizza
    }
}

fileprivate class PizzaListRepositoryInputMock: PizzaListRepositoryInput {
    var output: PizzaListRepositoryOuput?
    var getPizzaCalled = false
    func getPizza() {
        getPizzaCalled = true
    }
}
