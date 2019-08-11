//
//  UIView + Axis.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/10/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    func centerInView(_ view: UIView, withMargins margins: ESLAxisMargin = .zero) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: margins.x)
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: margins.y)
    }
    
    func centerInView(_ view: UIView, axis: ESLAxis, withMargin margin: CGFloat = .zero) {
        switch axis {
        case .x:
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: margin)
        case .y:
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: margin)
        }
    }
    
    func centerInSuperview(withMargins margins: ESLAxisMargin = .zero) {
        guard let superview = superview else { return }
        centerInView(superview, withMargins: margins)
    }
    
    func centerInSuperview(_ axis: ESLAxis, withMargin margin: CGFloat) {
        guard let superview = superview else { return }
        centerInView(superview, axis: axis, withMargin: margin)
    }
}
