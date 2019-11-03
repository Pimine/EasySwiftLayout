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
    
    /// Pins the edge of the view using the specified type of relation to the
    /// given edge of its superview with the inset and priority of the constraint.
    ///
    /// 1. Consider, accordingly to
    /// [Apple's documentation](https://apple.co/2PFH9f2), you cannot pin edges
    /// with different axis, otherwise it will throw fatal error.
    ///
    /// 2. Use this method only if you want to pin the edge of the view to the
    /// opposite margin of its superview, in other cases
    /// `pinEdgeToSuperview(_:usingRelation:withInset:priority:) would be a better
    /// approach.
    ///
    /// 3. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition:
    ///     - The view should have the superview, otherwise method will have no
    ///     effect.
    ///     - Pin edges with same axis or method will throw fatal error.
    ///
    /// - Parameter edge: The edge of this view to pin.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter superviewEdge: The edge of its superview to pin to.
    /// - Parameter inset: The inset between the edge of this view and the edge of
    /// its superview.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdge(
        _ edge: ESLEdge,
        usingRelation relation: NSLayoutRelation = .equal,
        toSuperviewEdge superviewEdge: ESLEdge,
        withInset inset: CGFloat = .zero,
        priority: UILayoutPriority = .required
    ) {
        guard let superview = superview else { return }
        pinEdge(edge, usingRelation: relation, toEdge: superviewEdge, ofView: superview, withInset: inset, priority: priority)
    }
    
    /// Pins the given edge of the view using the specified type of relation to
    /// the corresponding margin of its superview with the inset and priority of
    /// the constraint.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edge: The edge of this view to pin.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter inset: The inset beetween the edge of this view and the
    /// corresponding edge of its superview.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdgeToSuperview(
        _ edge: ESLEdge,
        usingRelation relation: NSLayoutRelation = .equal,
        withInset inset: CGFloat = .zero,
        priority: UILayoutPriority = .required
    ) {
        guard let superview = superview else { return }
        pinEdge(edge, usingRelation: relation, toSameEdgeOfView: superview, withInset: inset, priority: priority)
    }
    
    /// Pins the given edges of the view using the specified type of relation to
    /// the corresponding margins of its superview with the insets and priority of
    /// the constraints.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edges: The edges of this view to pin.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter insets: The insets beetween the edges of this view and the
    /// corresponding edges of its superview.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        usingRelation relation: NSLayoutRelation = .equal,
        withInsets insets: UIEdgeInsets = .zero,
        priority: UILayoutPriority = .required
    ) {
        guard let superview = superview else { return }
        pinEdges(edges, usingRelation: relation, toSameEdgesOfView: superview, withInsets: insets, priority: priority)
    }
    
    /// Pins the given edges of the view using the specified type of relation to
    /// the corresponding margins of its superview with the equal insets and
    /// priority of the constraints.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edges: The edges of this view to pin.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter inset: The inset beetween the edges of this view and the
    /// corresponding edges of its superview.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        usingRelation relation: NSLayoutRelation = .equal,
        withInset inset: CGFloat,
        priority: UILayoutPriority = .required
    ) {
        pinEdgesToSuperview(
            edges, usingRelation: relation,
            withInsets: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset),
            priority: priority
        )
    }
    
    /// Pins edges of the view of the given group using the specified type of
    /// relation to the corresponding margins of its superview with the equal
    /// insets and priority of the constraints.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's
    /// property`translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edgeGroup: The group of edges of this view to pin to.
    /// - Parameter relation: The type of relationship for the constraints.
    /// - Parameter inset: The inset beetween the edges of this view and
    /// corresponding edges of its superview.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdgesToSuperview(
        ofGroup group: ESLEdgeGroup,
        usingRelation relation: NSLayoutRelation = .equal,
        withInset inset: CGFloat = .zero,
        priority: UILayoutPriority = .required
    ) {
        guard let superview = superview else { return }
        pinEdges(ofGroup: group, usingRelation: relation, toSameEdgesOfView: superview, withInset: inset)
    }
    
    /// Pins the edges of the view using the specified type of relation to
    /// the corresponding margins of its superview with the insets and priority of
    /// the constraints, excluding one edge
    ///
    /// 1. If you don't need to customize the inset based on the edge, use
    /// `pinEdgesToSuperview(usingRelation:withInset:excludingEdge:priority:)`.
    ///
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter relation: The type of relationship for the constraints.
    /// - Parameter insets: The insets beetween the edges of this view and
    /// corresponding edges of another view.
    /// - Parameter excludedEdge: The edge to be ingored and not pinned.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdgesToSuperview(
        usingRelation relation: NSLayoutRelation = .equal,
        withInsets insets: UIEdgeInsets = .zero,
        excludingEdge excludedEdge: ESLEdge,
        priority: UILayoutPriority = .required
    ) {
        guard let superview = superview else { return }
        pinEdges(
            usingRelation: relation, toSameEdgesOfView: superview,
            withInsets: insets, excludingEdge: excludedEdge,
            priority: priority
        )
    }
    
    /// Pins the edges of the view using the specified type of relation to
    /// the corresponding margins of its superview with the equal inset and
    /// priority of the constraints, excluding one edge
    ///
    /// 1. If you don't need to customize the inset based on the edge, use
    /// `pinEdgesToSuperview(usingRelation:withInset:excludingEdge:priority:)`.
    ///
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter relation: The type of relationship for the constraints.
    /// - Parameter anotherView: Another view to pin to.
    /// - Parameter inset: The inset beetween the edges of this view and
    /// corresponding edges of its superview.
    /// - Parameter excludedEdge: The edge to be ingored and not pinned.
    /// - Parameter priority: The priority of the constraint.
    ///
    func pinEdgesToSuperview(
        usingRelation relation: NSLayoutRelation = .equal,
        withInset inset: CGFloat,
        excludingEdge excludedEdge: ESLEdge,
        priority: UILayoutPriority = .required
    ) {
        guard let superview = superview else { return }
        pinEdges(
            usingRelation: relation, toSameEdgesOfView: superview,
            withInset: inset, excludingEdge: excludedEdge,
            priority: priority
        )
    }
}
