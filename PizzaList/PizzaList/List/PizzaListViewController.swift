//
//  PizzaListViewController.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

protocol PizzaListPresenterOutput: class {
    func updateViewModel(viewModel: [String])
}

class PizzaListViewController: UIViewController {
    var presenter: PizzaListPresenterInput!
    var tableView: UITableView!
    var viewModel: [String] = []

    convenience init(presenter: PizzaListPresenterInput) {
        self.init()
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        tableView.dataSource = self
        presenter.getPizzas()
    }
}

extension PizzaListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
}

extension PizzaListViewController: PizzaListPresenterOutput {
    func updateViewModel(viewModel: [String]) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

// MARK: Design view
extension PizzaListViewController {
    func initView() {
        initTableView()
    }

    func initTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
