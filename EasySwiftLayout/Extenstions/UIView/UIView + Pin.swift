//
//  UIView + Pin.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/11/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    
    //MARK: - Abstraction for default
    
    func pin(
        topTo top: NSLayoutYAxisAnchor? = nil,
        leftTo left: NSLayoutXAxisAnchor? = nil,
        bottomTo bottom: NSLayoutYAxisAnchor? = nil,
        rightTo right : NSLayoutXAxisAnchor? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) {
        guard top != nil || left != nil || bottom != nil || right != nil else {
            print("[EasySwiftLayout] WARNING: You should pass at least one anchor. For now, nothing to pin. Method has no effect.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: insets.top).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: insets.left).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -insets.bottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -insets.right).isActive = true
        }
    }
    
    //MARK: - Pin Methods
    
    func pin(
        topTo top: ESLAnchor? = nil,
        leftTo left: ESLAnchor? = nil,
        bottomTo bottom: ESLAnchor? = nil,
        rightTo right: ESLAnchor? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) {
        guard top != nil || left != nil || bottom != nil || right != nil else {
            print("[EasySwiftLayout] WARNING: You should pass at least one anchor. For now, nothing to pin. Method has no effect.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            let anchor = top.convertToNSLayoutYAnchor()
            topAnchor.constraint(equalTo: anchor, constant: insets.top).isActive = true
        }
        
        if let left = left {
            let anchor = left.convertToNSLayoutXAnchor()
            leftAnchor.constraint(equalTo: anchor, constant: insets.left).isActive = true
        }
        
        if let bottom = bottom {
            let anchor = bottom.convertToNSLayoutYAnchor()
            bottomAnchor.constraint(equalTo: anchor, constant: -insets.bottom).isActive = true
        }
        
        if let right = right {
            let anchor = right.convertToNSLayoutXAnchor()
            rightAnchor.constraint(equalTo: anchor, constant: -insets.right).isActive = true
        }
    }
    
    func pinEdge(_ edge: ESLEdge, toEdge pinningEdge: ESLEdge, ofView view: UIView, withInset inset: CGFloat = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        switch edge {
        case .left, .right:
            let selfNSLayoutXAnchor = ESLAnchor(edge, ofView: self).convertToNSLayoutXAnchor()
            let pinningNSLayoutXAnchor = ESLAnchor(pinningEdge, ofView: view).convertToNSLayoutXAnchor()
            
            selfNSLayoutXAnchor.constraint(
                equalTo: pinningNSLayoutXAnchor,
                constant: inset * edge.insetMultiplier
            ).isActive = true
            
        case .top, .bottom:
            let selfNSLayoutYAnchor = ESLAnchor(edge, ofView: self).convertToNSLayoutYAnchor()
            let pinningNSLayoutYAnchor = ESLAnchor(pinningEdge, ofView: view).convertToNSLayoutYAnchor()
            
            selfNSLayoutYAnchor.constraint(
                equalTo: pinningNSLayoutYAnchor,
                constant: inset * edge.insetMultiplier
            ).isActive = true
            
        }
    }
    
    func pin(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfView view: UIView, withInsets insets: UIEdgeInsets = .zero) {
        for edge in edges {
            switch edge {
            case .left:
                pinEdge(.left, toEdge: .left, ofView: view, withInset: insets.left)
            case .right:
                pinEdge(.right, toEdge: .right, ofView: view, withInset: insets.right)
            case .top:
                pinEdge(.top, toEdge: .top, ofView: view, withInset: insets.top)
            case .bottom:
                pinEdge(.bottom, toEdge: .bottom, ofView: view, withInset: insets.bottom)
            }
        }
    }
    
    //MARK: - Superview Methods
    
    func pinEdgeToSuperview(_ edge: ESLEdge, withInset inset: CGFloat = .zero) {
        guard let superview = superview else {
            print("[EasySwiftLayout] WARNING: Cannot find superview. Method pinToSuperview(withMarign:) has no effect.")
            return
        }
        pinEdge(edge, toEdge: edge, ofView: superview, withInset: inset)
    }
    
    func pinEdgesToSuperview(_ edges: [ESLEdge] = ESLEdge.all, withInsets insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            print("[EasySwiftLayout] WARNING: Cannot find superview. Method pinToSuperview(:withMarigns:) has no effect.")
            return
        }
        pin(edges, toSameEdgesOfView: superview, withInsets: insets)
    }
}
