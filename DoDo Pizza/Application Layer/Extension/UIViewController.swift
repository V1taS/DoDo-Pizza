//
//  UIViewController.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

extension UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func showAlert(
        with title: String,
        and message: String,
        style: UIAlertController.Style,
        completion: @escaping () -> Void = { }
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
