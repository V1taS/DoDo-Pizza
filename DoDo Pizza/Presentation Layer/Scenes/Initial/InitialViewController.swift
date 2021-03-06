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
    
    // MARK: - Outlets
    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    @IBOutlet weak var tableView: UITableView!
        
    var presenter: InitialPresenterProtocol!
    
    var headerView: UIView?
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9490196078, blue: 0.9647058824, alpha: 1)
        self.tableView.rowHeight = 161
        self.tableView.allowsSelection = false
        self.tableView.registerCellNib(MainCell.self)
    }

}

// MARK: - InitialViewProtocol
extension InitialViewController: InitialViewProtocol {

}

// MARK: - Initial UITableViewDelegate and UITableViewDataSource
extension InitialViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier) as? MainCell else { return UITableViewCell() }
        cell.mainButton.apply(.btnOrangeBorder(title: "625 Р", radius: cell.mainButton.frame.height / 4))
        
        return cell
    }
}
