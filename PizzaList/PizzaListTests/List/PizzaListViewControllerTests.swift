//
//  PizzaListViewControllerTests.swift
//  PizzaListTests
//
//  Created by Thibaut Coutard on 01/01/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
@testable import PizzaList

class PizzaListViewControllerTests: XCTestCase {
    var presenter: PizzaListPresenterInputMock!
    var sut: PizzaListViewController!

    override func setUp() {
        presenter = PizzaListPresenterInputMock()
        sut = PizzaListViewController(presenter: presenter)
        sut.loadViewIfNeeded()
    }

    func test_PizzaListViewController_ViewDidLoad_CallsGetPizzas() {
        XCTAssertTrue(presenter.isGetPizzasCalled)
    }

    func test_PizzaListViewController_ViewDidLoad_IsTableViewDataSource() {
        XCTAssert(sut.tableView.dataSource is PizzaListViewController)
    }

    func test_PizzaListViewController_NumberOfRowsInSection_IsViewModelPizzaCells() {
        let viewModel = PizzaListViewModel(title: "Coucou", pizzaCells: [PizzaCellViewModel(name: "first", color: .Green), PizzaCellViewModel(name: "second", color: .Green)])
        sut.updateViewModel(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }

    func test_PizzaListViewController_CellForRow_UITableViewCell() {
        let firstPizza = PizzaCellViewModel(name: "first", color: .Green)
        let viewModel = PizzaListViewModel(title: "Coucou", pizzaCells: [firstPizza])
        sut.updateViewModel(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel?.text, firstPizza.name)
    }

    func test_PizzaListViewController_UpdateViewModel_UpdateTitle() {
        let viewModel = PizzaListViewModel(title: "Coucou", pizzaCells: [])
        sut.updateViewModel(viewModel: viewModel)
        XCTAssertEqual(sut.title, viewModel.title)
    }

    func test_PizzaListViewController_CellForRow_AsColorOfPizza() {
        let firstPizza = PizzaCellViewModel(name: "first", color: .Green)
        let viewModel = PizzaListViewModel(title: "title", pizzaCells: [firstPizza])
        sut.updateViewModel(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.backgroundColor, .green)
        let secondPizza = PizzaCellViewModel(name: "second", color: .None)
        let secondViewModel = PizzaListViewModel(title: "title", pizzaCells: [secondPizza])
        sut.updateViewModel(viewModel: secondViewModel)
        XCTAssertEqual(sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.backgroundColor, .clear)
    }
}

class PizzaListPresenterInputMock: PizzaListPresenterInput {
    var isGetPizzasCalled = false
    func getPizzas() {
        isGetPizzasCalled = true
    }
}
