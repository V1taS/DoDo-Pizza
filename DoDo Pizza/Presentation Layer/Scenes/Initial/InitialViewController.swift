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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Props
    private var pizza: [Pizza] = []
    private var adv = AdvStub.advArr
    var presenter: InitialPresenterProtocol!
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromNetwork()
        setupTableView()
        setupCollectionView()
    }
    
    // MARK: - Setup tableView
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.bounces = false
        self.tableView.backgroundColor = .white
        self.tableView.rowHeight = 161
        self.tableView.registerCellNib(MainCell.self)
    }
    
    // MARK: - Setup CollectionView
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: AdvertisingCell.identifier, bundle: nil), forCellWithReuseIdentifier: AdvertisingCell.identifier)
        self.collectionView.backgroundColor = .white
    }
    
    // MARK: - Setup ScrollView
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.bounces = false
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
        cell.pizzaImage.sd_setImage(with: URL(string: "\(model.urlPreview ?? "")"),
                                    placeholderImage: UIImage(named: "placeholder"))
        cell.descriptionLabel.text = model.description
        cell.mainButton.apply(.btnOrangeBorder(title: "\(model.price ?? 0) Р", radius: cell.mainButton.frame.height / 4))
        return cell
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

// MARK: - Initial UICollectionViewDelegate and UICollectionViewDataSource
extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        adv.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisingCell.identifier, for: indexPath) as? AdvertisingCell else { return UICollectionViewCell() }
        
        guard let currentADV = adv[indexPath.row] else { return cell }
        cell.advImage.image = currentADV
        
        return cell
    }
}
