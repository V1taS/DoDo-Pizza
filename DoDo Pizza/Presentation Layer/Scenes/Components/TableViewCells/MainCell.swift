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
    
    
    // MARK: - Initialization
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Setup functions
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - Setup functions
    func setupView() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.mainButton.layer.cornerRadius = self.mainButton.frame.height / 2
        self.mainButton.layer.masksToBounds = true
    }
}
