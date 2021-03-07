//
//  AdvertisingCell.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 06.03.2021.
//

import UIKit

class AdvertisingCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var advImage: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    // MARK: - Setup functions
    func setupView() {
        self.contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight]
    }
    
}
