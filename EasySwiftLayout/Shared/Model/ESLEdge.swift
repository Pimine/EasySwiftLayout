//
//  ESLEdge.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/11/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public enum ESLEdge {
    
    //MARK: - Vertical Variables
    
    case top
    case bottom
    
    //MARK: - Horizontal Variables
    
    case left
    case right
    
    //MARK: - Helpers
    
    public static let all: [ESLEdge] = [.top, .bottom, .left, .right]
    
    public var insetMultiplier: CGFloat {
        switch self {
        case .left, .top:
            return 1.0
        case .right, .bottom:
            return -1.0
        }
    }
}
