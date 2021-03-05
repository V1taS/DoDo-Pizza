//
//  BasicTabBarModel.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

class BasicTabBarModel {
    var title: String
    var controller: UIViewController
    var image: UIImage?
    var imageSelected: UIImage?
    
    init(title: String, controller: UIViewController, image: UIImage? = nil, imageSelected: UIImage? = nil) {
        self.title = title
        self.controller = controller
        self.image = image
        self.imageSelected = imageSelected
    }
}

extension BasicTabBarModel {
    static func stub(viewController: UIViewController) -> [BasicTabBarModel] {
        return [
            BasicTabBarModel(title: "Меню",
                             controller: viewController,
                             image: UIImage(systemName: "flame"),
                             imageSelected: UIImage(named: "flame")),
            BasicTabBarModel(title: "Профиль",
                             controller: InitialViewController(),
                             image: UIImage(systemName: "person.circle"),
                             imageSelected: UIImage(named: "person.circle")),
            BasicTabBarModel(title: "Контакты",
                             controller: InitialViewController(),
                             image: UIImage(systemName: "map"),
                             imageSelected: UIImage(named: "map")),
            BasicTabBarModel(title: "Корзина",
                             controller: InitialViewController(),
                             image: UIImage(systemName: "tray"),
                             imageSelected: UIImage(named: "tray"))]
    }
}
