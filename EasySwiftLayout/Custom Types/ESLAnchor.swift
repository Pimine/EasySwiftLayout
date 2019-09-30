//
//  ESLPinningEdge.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/15/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public struct ESLAnchor {
    
    //MARK: - Variables
    
    public let edge: ESLEdge
    public let view: UIView
    
    //MARK: - Life Cycle
    
    public init(_ edge: ESLEdge, ofView view: UIView) {
        self.edge = edge
        self.view = view
    }
    
    //MARK: - Helpers
    
    func convertToNSLayoutXAnchor() -> NSLayoutXAxisAnchor {
        switch edge {
        case .left:
            return view.leftAnchor
        case .right:
            return view.rightAnchor
        default:
            fatalError("[EasySwiftLayout] You cannot convert horizontal axis to NSLayoutXAxisAnchor")
        }
    }
    
    func convertToNSLayoutYAnchor() -> NSLayoutYAxisAnchor {
        switch edge {
        case .top:
            return view.topAnchor
        case .bottom:
            return view.bottomAnchor
        default:
            fatalError("[EasySwiftLayout] You cannot convert horizontal axis to NSLayoutYAxisAnchor")
        }
    }
}
