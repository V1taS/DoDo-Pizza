//
//  UIView.swift
//  DoDo Pizza
//
//  Created by Vitalii Sosin on 06.03.2021.
//

import UIKit

extension UIView {
    
    class func loadNib(withOwner owner: Any? = nil) -> Self {
        let name = String(describing: type(of: self)).components(separatedBy: ".")[0]
        let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: owner, options: nil)[0]
        return cast(view)!
    }
    
    func loadFromNibIfEmbeddedInDifferentNib() -> Self {
        let isPlaceholder = subviews.isEmpty
        if isPlaceholder {
            let realView = type(of: self).loadNib()
            realView.frame = frame
            translatesAutoresizingMaskIntoConstraints = false
            realView.translatesAutoresizingMaskIntoConstraints = false
            return realView
        }
        
        return self
    }
    
    func zoomIn(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = .identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    func zoomOut(duration : TimeInterval = 0.2) {
        self.transform = .identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
}

private func cast<T, U>(_ value: T) -> U? {
    return value as? U
}
