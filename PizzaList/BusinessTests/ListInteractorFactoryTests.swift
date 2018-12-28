//
//  ListInteractorFactoryTests.swift
//  BusinessTests
//
//  Created by Thibaut Coutard on 28/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import XCTest
@testable import Business

class ListInteractorFactoryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_PizzaListInteractorFactory_GetInteractor_ReturnsPizzaListInteractor() {
        let sut = PizzaListInteractorFactory(with: PizzaListRepositoryInputMock())
        XCTAssert(sut.getInteractor() is PizzaListInteractor)
    }
}

private class PizzaListRepositoryInputMock: PizzaListRepositoryInput {
    var output: PizzaListRepositoryOuput?

    func getPizza() {
    }
}
