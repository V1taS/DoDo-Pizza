//
//  UITableView.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 06.03.2021.
//

import UIKit

extension UITableView {
    
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}
