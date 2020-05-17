//
//  UIEdgeInsets + Helpers.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 10.11.2019.
//  Copyright © 2019 Denis Andreychuk. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    /// Creates equal insets for all 4 edges.
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
