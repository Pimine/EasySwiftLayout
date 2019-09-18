//
//  UIView + Size.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/19/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    @discardableResult func size(_ size: CGSize) -> Self {
        guard size.height != .zero || size.width != .zero else {
            log("You should pass at least one non-zero dimension. Method \(#function) has no effect.")
            return self
        }
        if size.height != 0 {
            height(size.height)
        }
        if size.width != 0 {
            width(size.width)
        }
        return self
    }
    
    @discardableResult func size(toRectWithDimension dimension: CGFloat) -> Self {
        guard dimension != .zero else {
            log("You should pass non-zero dimension. Method \(#function) has no effect.")
            return self
        }
        size(.init(width: dimension, height: dimension))
        return self
    }
    
    @discardableResult func width(_ size: CGFloat) -> Self {
        guard size != 0 else {
            log("You should pass non-zero size. For now, method \(#function) has no effect.")
            return self
        }
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
        return self
    }
    
    @discardableResult func height(_ size: CGFloat) -> Self{
        guard size != 0 else {
            log("You should pass non-zero size. Method \(#function) has no effect.")
            return self
        }
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: size).isActive = true
        return self
    }
}
