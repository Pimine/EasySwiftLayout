//
//  UIView + Size.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/19/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    func setSize(to size: CGSize) {
        guard size.height != .zero || size.width != .zero else {
            print("[EasySwiftLayout] WARNING: You should pass at least one non-zero dimension. For now, method setWidth(to:) has no effect.")
            return
        }
        if size.height != 0 {
            setHeight(to: size.height)
        }
        if size.width != 0 {
            setWidth(to: size.width)
        }
    }
    
    func setWidth(to size: CGFloat) {
        guard size != 0 else {
            print("[EasySwiftLayout] WARNING: You should pass non-zero size. For now, method setWidth(to:) has no effect.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
    }
    
    func setHeight(to size: CGFloat) {
        guard size != 0 else {
            print("[EasySwiftLayout] WARNING: You should pass non-zero size. For now, method setHeight(to:) has no effect.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: size).isActive = true
    }
}
