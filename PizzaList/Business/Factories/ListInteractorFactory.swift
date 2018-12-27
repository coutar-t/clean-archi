//
//  ListInteractorFactory.swift
//  Business
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

public class PizzaListInteractorFactory {
    private let repository: PizzaListRepositoryInput

    public init(with repository: PizzaListRepositoryInput) {
        self.repository = repository
    }

    public func getInteractor() -> PizzaListInteractorInput {
        let interactor = PizzaListInteractor(repository: repository)
        repository.output = interactor
        return interactor
    }
}
