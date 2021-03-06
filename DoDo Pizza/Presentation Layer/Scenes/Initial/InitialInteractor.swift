//
//  InitialInteractor.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import Foundation

protocol InitialInteractorInputProtocol {
    init(presenter: InitialInteractorOutputProtocol)
    func getObjects()
}

protocol InitialInteractorOutputProtocol: class {
    func provideObjects(_ value: [Pizza])
}

class InitialInteractor {
    unowned var presenter: InitialInteractorOutputProtocol
    
    // MARK: - Initialization
    required init(presenter: InitialInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

// MARK: - get Sections
extension InitialInteractor: InitialInteractorInputProtocol {
    func getObjects() {
        NetworkServices.shared.execute(AppDefaults.validAPIadress) { object in
            self.presenter.provideObjects(object ?? [])
        }
    }
}
