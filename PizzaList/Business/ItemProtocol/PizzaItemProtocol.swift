//
//  PizzaItem.swift
//  Business
//
//  Created by Thibaut Coutard on 27/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import Foundation

public protocol PizzaItemProtocol {
    var name: String { get set }
    var isVeggie: Bool { get set }
}
