//
//  InitialViewController.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

protocol InitialViewProtocol: class {

}

class InitialViewController: UIViewController {
    
    var presenter: InitialPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}

// MARK: - InitialViewProtocol
extension InitialViewController: InitialViewProtocol {

}
