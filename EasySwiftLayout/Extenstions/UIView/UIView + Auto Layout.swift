//
//  UIView + Auto Layout.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/10/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    convenience init(forAutoLayout: Void) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @discardableResult func translatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = value
        return self
    }
}
