//
//  InitialInteractor.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import Foundation

protocol InitialInteractorInputProtocol {
    init(presenter: InitialInteractorOutputProtocol)
}

protocol InitialInteractorOutputProtocol: class {

}

class InitialInteractor: InitialInteractorInputProtocol {
    unowned var presenter: InitialInteractorOutputProtocol
    
    required init(presenter: InitialInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
