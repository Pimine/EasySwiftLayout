//
//  ESMarginAxis.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/10/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import UIKit

public struct ESLOffset {
    
    //MARK: - Variables
    
    public let x: CGFloat
    public let y: CGFloat
    
    //MARK: - Static
    
    public static let zero = ESLOffset(x: 0, y: 0)
    
    //MARK: - Life Cycle
    
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
}
