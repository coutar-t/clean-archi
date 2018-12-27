//
//  PizzaListPresenterOutput.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

protocol PizzaListPresenterOutput: class {
    func updateViewModel(viewModel: PizzaListViewModel)
}
