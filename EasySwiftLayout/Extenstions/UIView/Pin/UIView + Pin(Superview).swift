//
//  UIView + Pin(Superview).swift
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
    
    /// Pins edge to the given edge of its superview with an inset.
    ///
    /// 1. Use this method only if you want to pin view's edge to opposite margin of its superview, in other cases
    /// `pinEdgeToSuperview(_:withInset:) would be a better approach.
    /// 2. Consider, that you cannot pin edge to different axis,
    /// otherwise method will throw `fatalError()`. X-axis constraints are not compatible with y-axis.
    /// 3. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition:
    ///     - View should have superview, otherwise method will have no effect.
    ///     - Pin edges with same axis or method will throw `fatalError()`
    ///
    /// - Parameter edge: The edge of this view to pin.
    /// - Parameter superviewEdge: The edge of its superview to pin to.
    /// - Parameter inset: Inset from the superview's bound
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdge(
        _ edge: ESLEdge,
        toSuperviewEdge superviewEdge: ESLEdge,
        withInset inset: CGFloat = .zero
    ) -> Self {
        guard let superview = superview else { return self }
        pinEdge(edge, toEdge: superviewEdge, ofView: superview)
        return self
    }
    
    /// Pins the given edge of the view to the corresponding margin of its superview with an inset.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edge: The edge of this view to pin to the corresponding margin.
    /// - Parameter inset: Inset from the superview's bound
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdgeToSuperview(_ edge: ESLEdge, withInset inset: CGFloat = .zero) -> Self {
        guard let superview = superview else { return self }
        pinEdge(edge, toSameEdgeOfView: superview, withInset: inset)
        return self
    }
    
    /// Pins the given edges of the view to the corresponding margins of its superview with an inset.
    ///
    /// 1. This method is intended to pin multiple edge, it is not recommended to use it for a single edge. For these purposes,
    /// `pinEdgeToSuperview(_:withInset:)` would be a better approach.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edges: The edge of this view to pin to the corresponding margin.
    /// - Parameter insets: Insets from the superview's bounds
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        guard let superview = superview else { return self }
        pinEdges(edges, toSameEdgesOfView: superview, withInsets: insets)
        return self
    }
    
    /// Pins the given edges of the view to the corresponding margins of its superview with equal inset.
    ///
    /// 1. This method is intended to pin multiple edge, it is not recommended to use it for a single edge. For these purposes,
    /// `pinEdgeToSuperview(_:withInset:)` would be a better approach.
    /// 2. If you want to customize inset based on edge,
    /// use `pinEdgesToSuperview(_:withInsets:)`.
    /// 3. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edges:The edge of this view to pin to the corresponding margin.
    /// - Parameter inset: Inset from superview's bounds.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInset inset: CGFloat
    ) -> Self {
        guard let _ = superview else { return self }
        pinEdgesToSuperview(edges, withInsets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
        return self
    }
    
    /// Pins left and right to the corresponding margins of its superview with equal inset
    ///
    /// 1. Helper method. Have the same benefits and requirement as `pinEdgesToSuperview(_:withInset:)`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter inset: Inset from superview's bounds.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinHorizontalEdgesToSuperview(withInset inset: CGFloat = .zero) -> Self {
        guard let _ = superview else { return self }
        pinEdgesToSuperview([.left, .right], withInset: inset)
        return self
    }
    
    /// Pins top and bottom to the corresponding margins of its superview with equal inset
    ///
    /// 1. Helper method. Have the same benefits and requirement as `pinEdgesToSuperview(_:withInset:)`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter inset: Inset from superview's bounds.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinVerticalEdgesToSuperview(withInset inset: CGFloat = .zero) -> Self {
        guard let _ = superview else { return self }
        pinEdgesToSuperview([.top, .bottom], withInset: inset)
        return self
    }
}
