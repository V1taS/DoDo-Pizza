//
//  BasicTabBarAssembly.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

enum BasicTabBarAssembly {
    
    static func create() -> BasicTabBarController {
        return BasicTabBarController()
    }
    
    static func configure(with reference: BasicTabBarController, data: [BasicTabBarModel]) {
        var rootControllers: [UIViewController] = []
        
        for controllerData in data {
            let rootController = controllerData.controller
            rootController.tabBarItem = UITabBarItem(title: controllerData.title, image: controllerData.image, selectedImage: controllerData.imageSelected)
            rootControllers.append(rootController)
        }
        reference.viewControllers = rootControllers
        reference.selectedIndex = 0
    }
}
