//
//  CustomNavigationBar.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

class CustomNavigationBar: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var cityButton: UIButton!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return self.loadFromNibIfEmbeddedInDifferentNib()
    }
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        cityButton.setTitle("Химки ▽", for: .normal)
        setupView()
    }
    
    // MARK: - Setup functions
    func setupView() {
        
        //
        //
        //        self.backgroundColor = .white
        //        cityButton.setTitle("Text", for: .normal)
        //        cityButton.backgroundColor = .red
        //        cityButton.tintColor = .red
    }
}
