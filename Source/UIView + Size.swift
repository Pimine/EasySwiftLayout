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

public extension UIView {
    
    /// Sets the width of the view to the given size with the priority of
    /// the constraint.
    ///
    /// 1. Constraints the width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter size: The size to set this view's width to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func width(_ size: CGFloat, priority: UILayoutPriority = .required) -> Self {
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
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter size: The size to set this view's width to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func width(_ relation: NSLayoutRelation, to size: CGFloat, priority: UILayoutPriority = .required) -> Self {
        guard size != 0 else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self, attribute: .width,
            relatedBy: relation,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: 1.0, constant: size
        )
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    /// Sets the height of the view to the given size with the priority of
    /// the constraint.
    ///
    /// 1. Constraints the height anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter size: The size to set this view's width to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func height(_ height: CGFloat, priority: UILayoutPriority = .required) -> Self {
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
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter size: The size to set this view's width to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func height(_ relation: NSLayoutRelation, to height: CGFloat, priority: UILayoutPriority = .required) -> Self {
        guard height != 0 else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(
            item: self, attribute: .height,
            relatedBy: relation,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: 1.0, constant: height
        )
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    /// Sets the dimensions of the view to the given size with the priority of
    /// the constraint.
    ///
    /// 1. Constraints the height and width anchors using `NSLayoutConstraint`
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter size: The size to set this view's dimensions to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(_ size: CGSize, priority: UILayoutPriority) -> Self {
        guard size != .zero else { return self }
        if size.height != 0 {
            height(size.height, priority: priority)
        }
        if size.width != 0 {
            width(size.width, priority: priority)
        }
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
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter size: The size to set this view's dimensions to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(_ relation: NSLayoutRelation, to size: CGSize, priority: UILayoutPriority) -> Self {
        guard size != .zero else { return self }
        if size.height != 0 {
            height(relation, to: size.height)
        }
        if size.width != 0 {
            width(relation, to: size.width)
        }
        return self
    }
    
    /// Sets the dimensions of the view to a square with the side using the
    /// specified type of relation to the given size with the priority of the
    /// constraint.
    ///
    /// 1. Constraints the height and width anchor using `NSLayoutConstraint`.
    /// 2. To make Auto-Layout works properly, it automatically sets view's
    /// property `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass size greater than zero, otherwise this method will
    /// have no effect.
    ///
    /// - Parameter relation: The type of relationship for constraint.
    /// - Parameter side: The side of the square to set this view's dimensions to.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func size(relation: NSLayoutRelation, toSquareWithSide side: CGFloat, priority: UILayoutPriority = .required) -> Self {
        guard side != .zero else { return self }
        size(relation, to: CGSize(width: side, height: side), priority: priority)
        return self
    }
}
