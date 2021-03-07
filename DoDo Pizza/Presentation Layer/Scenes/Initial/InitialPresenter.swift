//
//  InitialPresenter.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import Foundation

protocol InitialPresenterProtocol: class {
    init(viewController: InitialViewProtocol)
    func didRequestForData()
}

class InitialPresenter: InitialPresenterProtocol {

    unowned var viewController: InitialViewProtocol
    var interactor: InitialInteractorInputProtocol!
    required init(viewController: InitialViewProtocol) {
        self.viewController = viewController
    }
    
    func didRequestForData() {
        interactor.getObjects()
    }
}

// MARK: - InitialInteractorOutput
extension InitialPresenter: InitialInteractorOutputProtocol {
    func provideObjects(_ value: [Pizza]) {
        viewController.updateData(value)
    }
}
