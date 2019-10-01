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
    
    
    /// Pins edges to `NSLayoutAxisAnchor`.
    ///
    /// Small abstraction for default Swift layout. Use this method, only if you need to work with save area, otherwise
    /// prefer to one of method with higher abstraction and more compact syntax.
    ///
    /// - Precondition: You should pass at least one anchor, otherwise this method will have no effect.
    ///
    /// - Parameter top: Any Y-axis anchor to which top edge should be pinned.
    /// - Parameter left: Any X-axis anchor to which left edge should be pinned.
    /// - Parameter bottom: Any Y-axis anchor to which bottom edge should be pinned.
    /// - Parameter right: Any X-axis anchor to which right edge should be pinned.
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
    ///
    @discardableResult func pin(
        topTo top: NSLayoutYAxisAnchor? = nil,
        leftTo left: NSLayoutXAxisAnchor? = nil,
        bottomTo bottom: NSLayoutYAxisAnchor? = nil,
        rightTo right : NSLayoutXAxisAnchor? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        guard top != nil || left != nil || bottom != nil || right != nil else { return self }
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
    
    @discardableResult func pinEdges(
        _ edges: [ESLEdge] = ESLEdge.all,
        toSameEdgesOfView view: UIView,
        withInset inset: CGFloat
    ) -> Self {
        pinEdges(edges, toSameEdgesOfView: view, withInsets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
        return self
    }
}
