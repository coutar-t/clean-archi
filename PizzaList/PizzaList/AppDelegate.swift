//
//  AppDelegate.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import UIKit
import Repository
import Business

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()

        let repository = PizzaListRepositoryFactory().getRepository()
        let interactor = PizzaListInteractorFactory(with: repository).getInteractor()
        let presenter = PizzaListPresenter(interactor: interactor)
        let viewController = PizzaListViewController(presenter: presenter)

        interactor.output = presenter
        presenter.output = viewController

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

