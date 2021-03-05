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
