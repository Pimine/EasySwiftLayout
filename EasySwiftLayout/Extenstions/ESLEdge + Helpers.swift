//
//  ESLEdge + Helpers.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/11/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

extension ESLEdge {
    func convertToNSLayoutXAnchor(ofView view: UIView) -> NSLayoutXAxisAnchor {
        switch self {
        case .left:
            return view.leftAnchor
        case .right:
            return view.rightAnchor
        case .top, .bottom:
            fatalError("You cannot convert horizontal axis to NSLayoutYAxisAnchor")
        }
    }
    
    func convertToNSLayoutYAnchor(ofView view: UIView) -> NSLayoutYAxisAnchor {
        switch self {
        case .top:
            return view.topAnchor
        case .bottom:
            return view.bottomAnchor
        case .left, .right:
            fatalError("You cannot convert vertical axis to NSLayoutXAxisAnchor")
        }
    }
}
