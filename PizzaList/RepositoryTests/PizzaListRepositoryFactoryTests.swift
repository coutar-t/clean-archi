//
//  PizzaListRepositoryFactoryTests.swift
//  RepositoryTests
//
//  Created by Thibaut Coutard on 28/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import XCTest
@testable import Repository

class PizzaListRepositoryFactoryTests: XCTestCase {
    func test_PizzaListRepositoryFactory_GetRepository_ReturnsPizzaListRepository() {
        let sut = PizzaListRepositoryFactory()

        XCTAssertTrue(sut.getRepository() is PizzaListRepository)
    }
}
