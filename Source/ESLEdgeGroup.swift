//
//  ESLEdgeGroup.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 11/3/19.
//  Copyright © 2019 Denis Andreychuk. All rights reserved.
//

import Foundation

public enum ESLEdgeGroup {
    
    //MARK: - Cases
    
    case horizontal
    case vertical
    
    //MARK: - Variables
    
    var edges: [ESLEdge] {
        switch self {
        case .horizontal:
            return [.left, .right]
        case .vertical:
            return [.top, .bottom]
        }
    }
}
