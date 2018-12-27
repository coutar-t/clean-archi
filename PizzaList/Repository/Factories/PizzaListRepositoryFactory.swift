//
//  PizzaListRepositoryFactory.swift
//  Repository
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation
import Business

public class PizzaListRepositoryFactory {
    public init() {}

    public func getRepository() -> PizzaListRepositoryInput {
        return PizzaListRepository()
    }
}
