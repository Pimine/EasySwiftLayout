//
//  UIView + Pin.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/11/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    
    func pin(
        topTo top: NSLayoutYAxisAnchor? = nil,
        leftTo left: NSLayoutXAxisAnchor? = nil,
        bottomTo bottom: NSLayoutYAxisAnchor? = nil,
        rightTo right : NSLayoutXAxisAnchor? = nil,
        withMargins margins: UIEdgeInsets = .zero
    ) {
        if top == nil && left == nil && bottom == nil, right == nil {
            print("[EasySwiftLayout] WARNING: You should pass at least one anchor. For now, nothing to pin. Method has no effect.")
        }

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: margins.top).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: margins.left).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -margins.bottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -margins.right).isActive = true
        }
    }
    
    func pin(
        topTo top: ESLAnchor? = nil,
        leftTo left: ESLAnchor? = nil,
        bottomTo bottom: ESLAnchor? = nil,
        rightTo right: ESLAnchor? = nil,
        withMargins margins: UIEdgeInsets = .zero
    ) {
        if top == nil && left == nil && bottom == nil, right == nil {
            print("[EasySwiftLayout] WARNING: You should pass at least one anchor. For now, nothing to pin. Method has no effect.")
        }
        
        if let top = top {
            let anchor = top.convertToNSLayoutYAnchor()
            topAnchor.constraint(equalTo: anchor, constant: margins.top).isActive = true
        }
        
        if let left = left {
            let anchor = left.convertToNSLayoutXAnchor()
            leftAnchor.constraint(equalTo: anchor, constant: margins.left).isActive = true
        }
        
        if let bottom = bottom {
            let anchor = bottom.convertToNSLayoutYAnchor()
            bottomAnchor.constraint(equalTo: anchor, constant: -margins.bottom).isActive = true
        }
        
        if let right = right {
            let anchor = right.convertToNSLayoutXAnchor()
            rightAnchor.constraint(equalTo: anchor, constant: -margins.right).isActive = true
        }
    }
    
    func pinEdge(_ edge: ESLEdge, toEdge pinningEdge: ESLEdge, ofView view: UIView, withMargin margin: CGFloat = .zero) {
        switch edge {
        
        case .left, .right:
            let selfNSLayoutXAnchor = ESLAnchor(edge, ofView: self).convertToNSLayoutXAnchor()
            let pinningNSLayoutXAnchor = ESLAnchor(pinningEdge, ofView: view).convertToNSLayoutXAnchor()
            selfNSLayoutXAnchor.constraint(equalTo: pinningNSLayoutXAnchor, constant: margin).isActive = true
            
        case .top, .bottom:
            let selfNSLayoutYAnchor = ESLAnchor(edge, ofView: self).convertToNSLayoutYAnchor()
            let pinningNSLayoutYAnchor = ESLAnchor(pinningEdge, ofView: view).convertToNSLayoutYAnchor()
            selfNSLayoutYAnchor.constraint(equalTo: pinningNSLayoutYAnchor, constant: margin).isActive = true
        }
    }
    
    func pin(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfView view: UIView, withMargins margins: UIEdgeInsets = .zero) {
        for edge in edges {
            switch edge {
            case .left:
                pinEdge(.left, toEdge: .left, ofView: view, withMargin: margins.left)
            case .right:
                pinEdge(.right, toEdge: .right, ofView: view, withMargin: margins.right)
            case .top:
                pinEdge(.top, toEdge: .top, ofView: view, withMargin: margins.top)
            case .bottom:
                pinEdge(.bottom, toEdge: .bottom, ofView: view, withMargin: margins.bottom)
            }
        }
    }
    
    func pinToSuperview(_ edges: [ESLEdge] = ESLEdge.all, withMargins margins: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        pin(edges, toSameEdgesOfView: superview, withMargins: margins)
    }
}
