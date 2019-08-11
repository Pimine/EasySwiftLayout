//
//  UIView + Auto Layout.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/10/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    @discardableResult
    func setupForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
