//
//  RepositoryTests.swift
//  RepositoryTests
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import XCTest
import Business
@testable import Repository

class RepositoryTests: XCTestCase {

    var sut: PizzaListRepository!
    var mockOutput: MockPizzaRepositoryOutput!

    override func setUp() {
        sut = PizzaListRepository()
        mockOutput = MockPizzaRepositoryOutput()
        sut.output = mockOutput
    }

    func test_PizzaListRepository_GetPizzas_CallsOutput() {
        sut.getPizza()

        XCTAssertTrue(mockOutput.receivedPizzaCalled)
    }

    func test_PizzaListRepository_GetPizzas_CallsOutputWithPizzas() {
        let firstPizza = PizzaResponse(name: "First", isVeggie: true)
        let secondPizza = PizzaResponse(name: "Second", isVeggie: false)
        sut.pizzas = [firstPizza,
                      secondPizza]
        sut.getPizza()

        XCTAssertEqual(firstPizza, mockOutput.receivedPizza.first as! PizzaResponse)
        XCTAssertEqual(secondPizza, mockOutput.receivedPizza.last as! PizzaResponse)
        XCTAssertEqual(mockOutput.receivedPizza.count, 2)
    }
}

class MockPizzaRepositoryOutput: PizzaListRepositoryOuput {

    var receivedPizzaCalled = false
    var receivedPizza: [PizzaResponseProtocol] = []

    func receivedPizzas(with pizzas: [PizzaResponseProtocol]) {
        receivedPizzaCalled = true
        receivedPizza = pizzas
    }
}
