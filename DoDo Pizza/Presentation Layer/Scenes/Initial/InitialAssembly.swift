//
//  InitialAssembly.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import Foundation

enum InitialAssembly {
    
    // Create and return controller
    static func create() -> InitialViewController {
        return InitialViewController(nibName: InitialViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with viewController: InitialViewController) -> InitialPresenterProtocol {
        let presenter = InitialPresenter(viewController: viewController)
        let interactor = InitialInteractor(presenter: presenter)
        viewController.presenter = presenter
        presenter.interactor = interactor
        return presenter
    }
}
