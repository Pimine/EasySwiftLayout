//
//  UIView + Size.swift
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

// MARK: - Size using constants

public extension UIView {
    
    /// Sets the width of the view using the specified type of relation to the
    /// given size with the priority of the constraint.
    ///
    /// 1. Constraints the width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter size: The size to set this view's width to.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func width(
        _ size: CGFloat,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        guard size != 0 else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self, attribute: .width,
            relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: 1.0, constant: size
        )
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    /// Sets the height of the view using the specified type of relation to the
    /// given size with the priority of the constraint.
    ///
    /// 1. Constraints the height anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter size: The size to set this view's height to.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func height(
        _ height: CGFloat,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        guard height != 0 else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self, attribute: .height,
            relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: 1.0, constant: height
        )
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    /// Sets the dimensions of the view using the specified type of relation to
    /// the given size with the priority of the constraint.
    ///
    /// 1. Constraints the height and width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter size: The size to set this view's dimensions to.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(
        _ size: CGSize,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        height(size.height, priority: priority)
        width(size.width, priority: priority)
        return self
    }
    
    /// Sets the dimensions of the view to a square with the side using the
    /// specified type of relation to the given size with the priority of the
    /// constraint.
    ///
    /// 1. Constraints the height and width anchor using `NSLayoutConstraint`
    /// to match square size.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass side greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter side: The side of the square to set this view's dimensions to.
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(
        toSquareWithSide side: CGFloat,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        size(CGSize(width: side, height: side), usingRelation: relation, priority: priority)
        return self
    }
}

// MARK: - Size using another view

public extension UIView {
    
    /// Sets the width of the view using the specified type of relation to the
    /// width of another view with the inset and priority of the constraint.
    ///
    /// 1. Constraints the width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Parameter anotherView: Another view to set this view width to.
    /// - Parameter inset: The value to inset (or shrunk) the width. Negative
    /// value cause the width to be outset (or expanded).
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func width(
        to anotherView: UIView,
        withInset inset: CGFloat = .zero,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self, attribute: .width,
            relatedBy: relation,
            toItem: anotherView, attribute: .width,
            multiplier: 1.0, constant: -inset
        )
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    /// Sets the height of the view using the specified type of relation to the
    /// height of another view with the inset and priority of the constraint.
    ///
    /// 1. Constraints the width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Parameter anotherView: Another view to set this view height to.
    /// - Parameter inset: The value to inset (or shrunk) the height. Negative
    /// value cause the height to be outset (or expanded).
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func height(
        to anotherView: UIView,
        withInset inset: CGFloat = .zero,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self, attribute: .height,
            relatedBy: relation,
            toItem: anotherView, attribute: .height,
            multiplier: 1.0, constant: -inset
        )
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    /// Sets the size of the view using the specified type of relation to the
    /// size of another view with the insets and priority of the constraints.
    ///
    /// 1. Constraints the width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Parameter anotherView: Another view to set this view size to.
    /// - Parameter insets: The values to inset (or shrunk) the size. Negative
    /// values cause the size to be outset (or expanded).
    /// - Parameter relation: The type of relationship for constraints.
    /// - Parameter priority: The priority of the constraints.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(
        to anotherView: UIView,
        withInsets insets: ESL2DimensionalInsets = .zero,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        width(to: anotherView, withInset: insets.width, usingRelation: relation, priority: priority)
        height(to: anotherView, withInset: insets.height, usingRelation: relation, priority: priority)
        
        return self
    }
    
    /// Sets the size of the view using the specified type of relation to the
    /// size of another view with the equal insets and priority of the constraints.
    ///
    /// 1. Constraints the width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Parameter anotherView: Another view to set this view size to.
    /// - Parameter inset: The value to inset (or shrunk) the size. Negative
    /// value cause the size to be outset (or expanded).
    /// - Parameter relation: The type of relationship for constraints.
    /// - Parameter priority: The priority of the constraints.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(
        to anotherView: UIView,
        withInset inset: CGFloat = .zero,
        usingRelation relation: NSLayoutRelation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        size(
            to: anotherView,
            withInsets: ESL2DimensionalInsets(width: inset, height: inset),
            usingRelation: relation,
            priority: priority
        )
        
        return self
    }
}
