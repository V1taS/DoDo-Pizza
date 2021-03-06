//
//  BasicTabBarController.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 05.03.2021.
//

import UIKit

class BasicTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView() {
        
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        
        self.tabBar.tintColor = AppTheme.accentTextMain
        self.tabBar.backgroundColor = AppTheme.accentBarTintColor.withAlphaComponent(0.97)
        self.tabBar.unselectedItemTintColor = AppTheme.accentUnselected
        self.tabBar.isTranslucent = true
        guard let tabBarItems = self.tabBar.items else { return }
        for item in tabBarItems {
            item.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16.0)], for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
