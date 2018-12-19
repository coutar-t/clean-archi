//
//  AppDelegate.swift
//  PizzaList
//
//  Created by Thibaut Coutard on 19/12/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()

        let repository = PizzaListRepository()
        let interactor = PizzaListInteractor(repository: repository)
        let presenter = PizzaListPresenter(interactor: interactor)
        let viewController = PizzaListViewController(presenter: presenter)

        repository.output = interactor
        interactor.interactorOutput = presenter
        presenter.output = viewController

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

