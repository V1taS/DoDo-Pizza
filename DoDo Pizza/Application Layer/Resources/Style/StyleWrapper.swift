//
//  StyleWrapper.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 06.03.2021.
//

import UIKit

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)
}

extension StyleWrapper where Element: UIButton {
    
    static func btnOrangeBorder(title: String, radius: CGFloat) -> StyleWrapper {
        return .wrap { btn in
            btn.backgroundColor = .white
            btn.setTitle(title, for: UIControl.State())
            btn.setTitleColor(.orange, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 13)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.orange.cgColor
            btn.layer.borderWidth = 1.0
            btn.layer.cornerRadius = radius
        }
    }
}
