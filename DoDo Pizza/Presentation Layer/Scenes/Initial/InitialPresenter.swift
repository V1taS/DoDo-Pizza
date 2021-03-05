//
//  InitialPresenter.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import Foundation

protocol InitialPresenterProtocol: class {
    init(viewController: InitialViewProtocol)
}

class InitialPresenter: InitialPresenterProtocol {
    unowned var viewController: InitialViewProtocol
    var interactor: InitialInteractorInputProtocol!
    
    required init(viewController: InitialViewProtocol) {
        self.viewController = viewController
    }
}

// MARK - InitialInteractorOutput
extension InitialPresenter: InitialInteractorOutputProtocol {

}
