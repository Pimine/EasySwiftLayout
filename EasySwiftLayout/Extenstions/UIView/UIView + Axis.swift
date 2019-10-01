//
//  UIView + Axis.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/10/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    @discardableResult func centerInView(_ view: UIView, withMargins margins: ESLAxisMargin = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: margins.x).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: margins.y).isActive = true
        return self
    }
    
    @discardableResult func centerInView(_ view: UIView, axis: ESLAxis, withMargin margin: CGFloat = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        switch axis {
        case .x:
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: margin).isActive = true
        case .y:
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: margin).isActive = true
        }
        return self
    }
    
    @discardableResult func centerInSuperview(_ axis: ESLAxis, withMargin margin: CGFloat = .zero) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, axis: axis, withMargin: margin)
        return self
    }
    
    @discardableResult func centerInSuperview(withMargins margins: ESLAxisMargin = .zero) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, withMargins: margins)
        return self
    }
}
