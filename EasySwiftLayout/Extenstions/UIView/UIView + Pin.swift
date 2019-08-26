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
    
    @discardableResult func pin(
        topTo top: NSLayoutYAxisAnchor? = nil,
        leftTo left: NSLayoutXAxisAnchor? = nil,
        bottomTo bottom: NSLayoutYAxisAnchor? = nil,
        rightTo right : NSLayoutXAxisAnchor? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        guard top != nil || left != nil || bottom != nil || right != nil else {
            log("You should pass at least one anchor. Method \(#function) has no effect.")
            return self
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
        return self
    }
    
    //MARK: - Pin Methods
    
    @discardableResult func pin(
        topTo top: ESLAnchor? = nil,
        leftTo left: ESLAnchor? = nil,
        bottomTo bottom: ESLAnchor? = nil,
        rightTo right: ESLAnchor? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        guard top != nil || left != nil || bottom != nil || right != nil else {
            log("You should pass at least one anchor. Method \(#function) has no effect.")
            return self
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
        return self
    }
    
    @discardableResult func pinEdge(
        _ edge: ESLEdge,
        toEdge pinningEdge: ESLEdge,
        ofView view: UIView,
        withInset inset: CGFloat = .zero
    ) -> Self {
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
        return self
    }
    
    @discardableResult func pinEdge(_ edge: ESLEdge, toSameEdgeOfView view: UIView, withInset inset: CGFloat = .zero) -> Self {
        pinEdge(edge, toEdge: edge, ofView: view, withInset: inset)
        return self
    }
    
    @discardableResult func pinEdges(
        _ edges: [ESLEdge] = ESLEdge.all,
        toSameEdgesOfView view: UIView,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        for edge in edges {
            switch edge {
            case .left:
                pinEdge(.left, toSameEdgeOfView: view, withInset: insets.left)
            case .right:
                pinEdge(.right, toSameEdgeOfView: view, withInset: insets.right)
            case .top:
                pinEdge(.top, toSameEdgeOfView: view, withInset: insets.top)
            case .bottom:
                pinEdge(.bottom, toSameEdgeOfView: view, withInset: insets.bottom)
            }
        }
        return self
    }
    
    //MARK: - Superview Methods
    
    @discardableResult func pinEdge(
        _ edge: ESLEdge,
        toSuperviewEdge superviewEdge: ESLEdge,
        withInset inset: CGFloat = .zero
    ) -> Self {
        guard let superview = superview else {
            log("Cannot find superview. Method \(#function) has no effect.")
            return self
        }
        pinEdge(edge, toEdge: superviewEdge, ofView: superview)
        return self
    }
    
    @discardableResult func pinEdgeToSuperview(_ edge: ESLEdge, withInset inset: CGFloat = .zero) -> Self {
        guard let superview = superview else {
            log("Cannot find superview. Method \(#function) has no effect.")
            return self
        }
        pinEdge(edge, toSameEdgeOfView: superview, withInset: inset)
        return self
    }
    
    @discardableResult func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        guard let superview = superview else {
            log("Cannot find superview. Method \(#function) has no effect.")
            return self
        }
        pinEdges(edges, toSameEdgesOfView: superview, withInsets: insets)
        return self
    }
}
