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
    
    public static let all: [ESLEdge] = [.top, .bottom, .left, .right]
}
