//
//  UIView + Pin.swift
//  https://github.com/denandreychuk/EasySwiftLayout
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2019 Denis Andreychuk
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

public extension UIView {
    
    //MARK: - Abstraction for default
    
    /// Pins edges to the given `NSLayoutAxisAnchor`s.
    ///
    /// Compact version of default Swift layout. Allows you to pin each edge to specific `NSLayoutAxisAnchor`.
    ///
    /// - Precondition: You should pass at least one anchor, otherwise this method will have no effect.
    ///
    /// - Parameter top: Y-axis anchor to pin to top.
    /// - Parameter left: X-axis anchor to pin to left.
    /// - Parameter bottom: Y-axis anchor to pin to bottom.
    /// - Parameter right: X-axis anchor to pin to right.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
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

    /// Pins edge to the given edge of another view with an inset.
    ///
    /// 1. Consider, that you cannot pin edge to different axis, otherwise method will throw `fatalError()`.
    /// X-axis constraints are not compatible with y-axis.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition:
    ///     - nother view must be in the same view hierarchy as this view.
    ///     - Pin edges with same axis or method will throw `fatalError()`
    ///
    /// - Parameter edge: The edge of this view to pin.
    /// - Parameter pinningEdge: The edge of the other view to pin to.
    /// - Parameter view: Another view to pin to.
    /// - Parameter inset: Inset beetween edge of this view and edge of another view
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
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
    
    /// Pins the given edge of the view to the corresponding margin of another view with an inset.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this view.
    ///
    /// - Parameter edge: The edge of this view to pin to.
    /// - Parameter view: Another view to pin to.
    /// - Parameter inset: Inset beetween edge of this view and corresponding edge of another view
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdge(_ edge: ESLEdge, toSameEdgeOfView view: UIView, withInset inset: CGFloat = .zero) -> Self {
        pinEdge(edge, toEdge: edge, ofView: view, withInset: inset)
        return self
    }
    
    /// Pins the given edges of the view to the corresponding margins of another view with insets.
    ///
    /// 1. This method is intended to pin multiple edges, it is not recommended to use it for a single edge. For these purposes,
    /// `pinEdge(_:toSameEdgeOfView:withInset:)` would be a better approach.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this view.
    ///
    /// - Parameter edges: The edges of this view to pin.
    /// - Parameter view: Another view to pin to.
    /// - Parameter inset: Inset beetween edges of this view and corresponding edges of another view
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdges(
        _ edges: [ESLEdge] = ESLEdge.all,
        toSameEdgesOfView view: UIView,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        print(#function)
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
    
    /// Pins the given edges of the view to the corresponding margins of another view with equal inset.
    ///
    /// 1. This method is intended to pin multiple edges, it is not recommended to use it for a single edge. For these purposes,
    /// `pinEdge(_:toSameEdgeOfView:withInset:)` would be a better approach.
    /// 2. If you want to customize inset based on edge, use `pinEdges(_:toSameEdgesOfView:withInsets:)`.
    /// 3. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this view.
    ///
    /// - Parameter edges: The edges of this view to pin.
    /// - Parameter view: Another view to pin to.
    /// - Parameter inset: Inset beetween edges of this view and corresponding edges of another view
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdges(
        _ edges: [ESLEdge] = ESLEdge.all,
        toSameEdgesOfView view: UIView,
        withInset inset: CGFloat
    ) -> Self {
        pinEdges(edges, toSameEdgesOfView: view, withInsets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
        return self
    }
}
