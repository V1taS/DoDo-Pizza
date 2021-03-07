//
//  MainCell.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

class MainCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Initialization
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - Setup functions
    func setupView() {
        mainButton.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        mainButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.mainButton.layer.cornerRadius = self.mainButton.frame.height / 2
        self.mainButton.layer.masksToBounds = true
    }
}

// MARK: - Actions
extension MainCell {
    @objc private func touchUpInside() {
        mainButton.setTitleColor(.orange, for: .normal)
        mainButton.backgroundColor = .white
    }
    
    @objc private func touchDown() {
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.backgroundColor = .orange
    }
}
