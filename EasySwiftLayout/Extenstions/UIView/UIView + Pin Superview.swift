//
//  UIView + Pin Superview.swift
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

import UIKit

public extension UIView {
    
    /// Pins edge to superview edge with inset.
    ///
    /// Use this method, only if you want to pin edge to different superview's edge. Take in mind, that edges should be
    /// axis compatible (see Precondition), otherwise use `pinEdgeToSuperview(_:withInset:)` instead.
    ///
    /// - Precondition:
    ///     - View should have superview, otherwise this method will have no effect.
    ///     - You should pass edges which are axis compatible, which means that you cannot pin `NSLayoutXAxisAnchor` to
    ///     `NSLayoutYAxisAnchor` (for example `.top` to `.left`). If you do so, method will throw `fatalError()`
    ///
    /// - Parameter edge: View's edge which should be pinned.
    /// - Parameter superviewEdge: Superview's edge to which view's `edge` should be pinned.
    /// - Parameter inset: Inset from the edge of the superview's bounds
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
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
    
    /// Pins edge to the same edge of superview with inset
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edge: View's edge which should be pinned to same edge of superview.
    /// - Parameter inset: Inset from the edge of the superview's bounds
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdgeToSuperview(_ edge: ESLEdge, withInset inset: CGFloat = .zero) -> Self {
        guard let superview = superview else { return self }
        pinEdge(edge, toSameEdgeOfView: superview, withInset: inset)
        return self
    }
    
    /// Pins multiple edges to the same edges of superview with insets
    ///
    /// Use this method only if you want to pin multiple edges, otherwise use `pinEdgeToSuperview(_:withInset:)` instead.
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edges: View's edge which should be pinned to same edge of superview.
    /// - Parameter insets: Inset from the edge of the superview's bounds
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInsets insets: UIEdgeInsets = .zero
    ) -> Self {
        guard let superview = superview else { return self }
        pinEdges(edges, toSameEdgesOfView: superview, withInsets: insets)
        return self
    }
    
    /// Pins multiple edges to the same edges of superview with equal inset for all sides
    ///
    /// Use this method only if you want to pin multiple edges, otherwise use `pinEdgeToSuperview(_:withInset:)` instead.
    /// If you to customize inset for different edges, use `pinEdgesToSuperview(_:withInsets:)` which takes `UIEdgeInsets`.
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edges: View's edge which should be pinned to same edge of superview.
    /// - Parameter insets: Insets from the edges of the superview's bounds
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInset inset: CGFloat
    ) -> Self {
        guard let _ = superview else { return self }
        pinEdgesToSuperview(edges, withInsets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
        return self
    }
    
    /// Pins horizontal edges (left and right) to the same edges of superview with equal inset for both sides
    ///
    /// Small helper method which can speed up work a litle bit. I found it easier to use autocomplete rather than specifying two
    /// edges by myself. Underhood it uses common `pinEdgesToSuperview(_:withInset:)`.
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edges: View's edge which should be pinned to same edge of superview.
    /// - Parameter inset: Inset from the horizontal edges of the superview's bounds
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinHorizontalEdgesToSuperview(withInset inset: CGFloat = .zero) -> Self {
        guard let _ = superview else { return self }
        pinEdgesToSuperview([.left, .right], withInset: inset)
        return self
    }
    
    /// Pins vertical edges (top and bottom) to the same edges of superview with equal inset for both sides
    ///
    /// Small helper method which can speed up work a litle bit. I found it easier to use autocomplete rather than specifying two
    /// edges by myself. Underhood it uses common `pinEdgesToSuperview(_:withInset:)`.
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter edges: View's edge which should be pinned to same edge of superview.
    /// - Parameter inset: Inset from the vertical edges of the superview's bounds
    ///
    /// - Returns: This method return `Self` with attribute `@discardableResult`.
    ///
    @discardableResult func pinVerticalEdgesToSuperview(withInset inset: CGFloat = .zero) -> Self {
        guard let _ = superview else { return self }
        pinEdgesToSuperview([.top, .bottom], withInset: inset)
        return self
    }
}
