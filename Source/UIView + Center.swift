//
//  UIView + Axis.swift
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
    
    //MARK: Center in the given view
    
    /// Centers the axis of this view in another view with the offset and priority
    /// of the constraint.
    ///
    /// To make Auto-Layout works properly, it automatically sets view property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this
    /// view.
    ///
    /// - Parameter anotherView: Another view to center in.
    /// - Parameter axis: Axis to center.
    /// - Parameter offset: Axis offset.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func centerInView(
        _ anotherView: UIView, axis: ESLAxis,
        withOffset offset: CGFloat = .zero,
        priority: UILayoutPriority = .required
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch axis {
        case .x:
            let constraint = NSLayoutConstraint(
                item: self, attribute: .centerX,
                relatedBy: .equal,
                toItem: anotherView,
                attribute: .centerX,
                multiplier: 1.0, constant: offset
            )
            constraint.priority = priority
            constraint.isActive = true
            
        case .y:
            let constraint = NSLayoutConstraint(
                item: self, attribute: .centerY,
                relatedBy: .equal,
                toItem: anotherView,
                attribute: .centerY,
                multiplier: 1.0, constant: offset
            )
            constraint.priority = priority
            constraint.isActive = true
        }
        return self
    }
    
    /// Centers the view in another view with the offset and priority of the
    /// constraint.
    ///
    /// To make Auto-Layout works properly, it automatically sets view property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this
    /// view.
    ///
    /// - Parameter anotherView: Another view to center in.
    /// - Parameter offset: Axis offset.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func centerInView(
        _ anotherView: UIView,
        withOffset offset: ESLOffset = .zero,
        priority: UILayoutPriority = .required
    ) -> Self {
        centerInView(anotherView, axis: .x, withOffset: offset.x, priority: priority)
        centerInView(anotherView, axis: .y, withOffset: offset.y, priority: priority)
        
        return self
    }
    
    //MARK: Center in superview
    
    /// Centers the view in its superview view with the offset and priority of the
    /// constraint.
    ///
    /// To make Auto-Layout works properly, it automatically sets view property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter offset: Axis offset.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func centerInSuperview(withOffset offset: ESLOffset = .zero, priority: UILayoutPriority = .required) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, withOffset: offset, priority: priority)
        return self
    }
    
    /// Centers the axis of this view in its superview with the offset and priority
    /// of the constraint.
    ///
    /// To make Auto-Layout works properly, it automatically sets view property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: The view should have the superview, otherwise this method
    /// will have no effect.
    ///
    /// - Parameter axis: Axis to center.
    /// - Parameter offset: Axis offset.
    /// - Parameter priority: The priority of the constraint.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult
    func centerInSuperview(
        axis: ESLAxis,
        withOffset offset: CGFloat = .zero,
        priority: UILayoutPriority = .required
    ) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, axis: axis, withOffset: offset, priority: priority)
        return self
    }
}
