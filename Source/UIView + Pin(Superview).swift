//
//  UIView + Pin(Superview).swift
//  https://github.com/denandreychuk/EasySwiftLayout
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2019-2020 Denis Andreychuk
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
    /// Optionally respects one of pre-defined Apple's layout guides.
    ///
    /// 1. Consider, accordingly to
    /// [Apple's documentation](https://apple.co/2PFH9f2), you cannot pin edges
    /// with different axis, otherwise it will throw fatal error.
    ///
    /// 2. Use this method only if you want to pin the edge of the view to the
    /// opposite margin of its superview, in other cases
    /// [pinEdgeToSuperview(_:withInset:usingRelation:priority:)](x-source-tag://superview_toSameEdgeOfView_inset)
    /// would be a better approach.
    ///
    /// 3. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Precondition:
    ///     - The view should have the superview, otherwise method will have no
    ///     effect.
    ///     - Pin edges with same axis or method will throw fatal error.
    ///
    /// - Parameter edge: The edge of this view to pin.
    /// - Parameter superviewEdge: The edge of its superview to pin to.
    /// - Parameter inset: The inset between the edge of this view and the edge of
    /// its superview.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func pinEdge(
        _ edge: ESLEdge,
        toSuperviewEdge superviewEdge: ESLEdge,
        withInset inset: CGFloat = .zero,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        guard let superview = superview else { return self }
        
        switch guide {
        case .none:
            pinEdge(edge,
               toEdge: superviewEdge,
               ofView: superview,
               withInset: inset,
               usingRelation: relation,
               priority: priority
            )
        default:
            let guide = guide.convertedToESLGuide(superview: superview)!
            pinEdge(edge,
                toEdge: superviewEdge,
                ofGuide: guide,
                withInset: inset,
                usingRelation: relation,
                priority: priority
            )
        }
        return self
    }
    
    /// Pins the given edge of the view using the specified type of relation to
    /// the corresponding margin of its superview with the inset and priority of
    /// the constraint. Optionally respects one of pre-defined Apple's layout
    /// guides.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edge: The edge of this view to pin.
    /// - Parameter inset: The inset beetween the edge of this view and the
    /// corresponding edge of its superview.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    /// - Tag: superview_toSameEdgeOfView_inset
    ///
    @discardableResult
    func pinEdgeToSuperview(
        _ edge: ESLEdge,
        withInset inset: CGFloat = .zero,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        guard let superview = superview else { return self }
        
        switch guide {
        case .none:
            pinEdge(edge,
               toSameEdgeOfView: superview,
               withInset: inset,
               usingRelation: relation,
               priority: priority
            )
        default:
            let guide = guide.convertedToESLGuide(superview: superview)!
            pinEdge(edge,
                toSameEdgeOfGuide: guide,
                withInset: inset,
                usingRelation: relation,
                priority: priority
            )
        }
        return self
    }
    
    /// Pins the given edges of the view using the specified type of relation to
    /// the corresponding margins of its superview with the insets and priority of
    /// the constraints. Optionally respects one of pre-defined Apple's layout
    /// guides.
    ///
    /// 1. If you don't need to customize the insets based on the edge, use
    /// [pinEdgesToSuperview(_:withInset:usingRelation:priority:)](x-source-tag://superview_toSameEdgesOfView_inset).
    ///
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edges: The edges of this view to pin.
    /// - Parameter insets: The insets beetween the edges of this view and the
    /// corresponding edges of its superview.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    /// - Tag: superview_toSameEdgesOfView_insets
    ///
    @discardableResult
    func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInsets insets: UIEdgeInsets = .zero,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        guard let superview = superview else { return self }
        
        switch guide {
        case .none:
            pinEdges(edges,
               toSameEdgesOfView: superview,
               withInsets: insets,
               usingRelation: relation,
               priority: priority
            )
        default:
            let guide = guide.convertedToESLGuide(superview: superview)!
            pinEdges(edges,
                toSameEdgesOfGuide: guide,
                withInsets: insets,
                usingRelation: relation,
                priority: priority
            )
        }
        return self
    }
    
    /// Pins the given edges of the view using the specified type of relation to
    /// the corresponding margins of its superview with the equal insets and
    /// priority of the constraints. Optionally respects one of pre-defined Apple's
    /// layout guides.
    ///
    /// 1. If you need to customize the insets based on the edge, use
    /// [pinEdgesToSuperview(_:withInsets:usingRelation:priority:)](x-source-tag://superview_toSameEdgesOfView_insets).
    ///
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter edges: The edges of this view to pin.
    /// - Parameter inset: The inset beetween the edges of this view and the
    /// corresponding edges of its superview.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    /// - Tag: superview_toSameEdgesOfView_inset
    ///
    @discardableResult
    func pinEdgesToSuperview(
        _ edges: [ESLEdge] = ESLEdge.all,
        withInset inset: CGFloat,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        pinEdgesToSuperview(edges,
            withInsets: UIEdgeInsets(inset: inset),
            respectingGuide: guide,
            usingRelation: relation,
            priority: priority
        )
    }
    
    /// Pins edges of the view of the given group using the specified type of
    /// relation to the corresponding margins of its superview with the equal
    /// insets and priority of the constraints. Optionally respects one of
    /// pre-defined Apple's layout guides.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`.
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter group: The group of edges of this view to pin to.
    /// - Parameter inset: The inset beetween the edges of this view and
    /// corresponding edges of its superview.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for the constraints.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func pinEdgesToSuperview(
        ofGroup group: ESLEdgeGroup,
        withInset inset: CGFloat = .zero,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        pinEdgesToSuperview(group.edges,
            withInset: inset,
            respectingGuide: guide,
            usingRelation: relation,
            priority: priority
        )
    }
    
    /// Pins the edges of the view using the specified type of relation to the
    /// corresponding margins of its superview with the insets and priority of the
    /// constraints, excluding one edge. Optionally respects one of pre-defined
    /// Apple's layout guides.
    ///
    /// 1. If you need to customize the insets based on the edge, use
    /// [pinEdgesToSuperview(excludingEdge:withInset:usingRelation:priority:)](x-source-tag://superview_excludingEdge_inset).
    ///
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter excludedEdge: The edge to be ingored and not pinned.
    /// - Parameter insets: The insets beetween the edges of this view and
    /// corresponding edges of another view.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for the constraints.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    /// - Tag: superview_excludingEdge_insets
    ///
    @discardableResult
    func pinEdgesToSuperview(
        excludingEdge excludedEdge: ESLEdge,
        withInsets insets: UIEdgeInsets = .zero,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        let edges = ESLEdge.all.filter { $0 != excludedEdge }
        pinEdgesToSuperview(edges,
            withInsets: insets,
            respectingGuide: guide,
            usingRelation: relation,
            priority: priority
        )
        return self
    }
    
    /// Pins the edges of the view using the specified type of relation to the
    /// corresponding margins of its superview with the equal inset and priority
    /// of the constraints, excluding one edge. Optionally respects one of
    /// pre-defined Apple's layout guides.
    ///
    /// 1. If you need to customize the insets based on the edge, use
    /// [pinEdgesToSuperview(excludingEdge:withInsets:usingRelation:priority:)](x-source-tag://superview_excludingEdge_insets).
    ///
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter excludedEdge: The edge to be ingored and not pinned.
    /// - Parameter inset: The inset beetween the edges of this view and
    /// corresponding edges of its superview.
    /// - Parameter guide: The guide to respect in layout.
    /// - Parameter relation: The type of relationship for the constraints.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    /// - Tag: superview_excludingEdge_inset
    ///
    @discardableResult
    func pinEdgesToSuperview(
        excludingEdge excludedEdge: ESLEdge,
        withInset inset: CGFloat,
        respectingGuide guide: ESLSuperviewGuide = .none,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        pinEdgesToSuperview(
            excludingEdge: excludedEdge,
            withInsets: UIEdgeInsets(inset: inset),
            respectingGuide: guide,
            usingRelation: relation,
            priority: priority
        )
    }
}
