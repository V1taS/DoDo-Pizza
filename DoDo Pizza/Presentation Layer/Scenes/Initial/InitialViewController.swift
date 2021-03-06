//
//  InitialViewController.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit
import SDWebImage

protocol InitialViewProtocol: class {
    func updateData(_ sections: [Pizza])
}

class InitialViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var customNavigationBar: CustomNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Props
    private var pizza: [Pizza] = []
    var presenter: InitialPresenterProtocol!
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromNetwork()
        setupComponents()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9490196078, blue: 0.9647058824, alpha: 1)
        self.tableView.rowHeight = 161
        self.tableView.registerCellNib(MainCell.self)
    }
    
}

// MARK: - Actions
extension InitialViewController {
    private func getDataFromNetwork() {
        presenter.didRequestForData()
    }
}

// MARK: - InitialViewProtocol
extension InitialViewController: InitialViewProtocol {
    func updateData(_ pizza: [Pizza]) {
        self.pizza = pizza
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }
    }
}

// MARK: - Initial UITableViewDelegate and UITableViewDataSource
extension InitialViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier) as? MainCell else { return UITableViewCell() }
        
        let model = self.pizza[indexPath.row]
        
        cell.titleLabel.text = model.nameRu
        cell.pizzaImage.sd_setImage(with: URL(string: "\(model.urlPreview ?? "")"))
        cell.descriptionLabel.text = model.description
        cell.mainButton.apply(.btnOrangeBorder(title: "\(model.price ?? 0) Р", radius: cell.mainButton.frame.height / 4))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MainCell {
            cell.zoomOut()
        }}
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MainCell {
            cell.zoomIn()
        }}
}
