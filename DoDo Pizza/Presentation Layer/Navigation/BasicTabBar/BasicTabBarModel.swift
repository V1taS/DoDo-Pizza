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
                             image: UIImage(named: "menu"),
                             imageSelected: UIImage(named: "menu")),
            BasicTabBarModel(title: "Профиль",
                             controller: InitialViewController(),
                             image: UIImage(named: "profile"),
                             imageSelected: UIImage(named: "profile")),
            BasicTabBarModel(title: "Контакты",
                             controller: InitialViewController(),
                             image: UIImage(named: "contact"),
                             imageSelected: UIImage(named: "contact")),
            BasicTabBarModel(title: "Корзина",
                             controller: InitialViewController(),
                             image: UIImage(named: "basket"),
                             imageSelected: UIImage(named: "basket"))]
    }
}
