//
//  UIView + Axis.swift
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
    
    //MARK: Center in the given view
    
    /// Centers the view in the given view with offset.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this view.
    ///
    /// - Parameter anotherView: View to center in
    /// - Parameter offset: Axis offset
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func centerInView(_ anotherView: UIView, withOffset offset: ESLOffset = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anotherView.centerXAnchor, constant: offset.x).isActive = true
        centerYAnchor.constraint(equalTo: anotherView.centerYAnchor, constant: offset.y).isActive = true
        return self
    }
    
    /// Centers the given axis of the view in another view with offset.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Another view must be in the same view hierarchy as this view.
    ///
    /// - Parameter view: View to center in
    /// - Parameter axis: Axis to center
    /// - Parameter offset: Axis offset
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func centerInView(_ anotherView: UIView, axis: ESLAxis, withOffset offset: CGFloat = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        switch axis {
        case .x:
            centerXAnchor.constraint(equalTo: anotherView.centerXAnchor, constant: offset).isActive = true
        case .y:
            centerYAnchor.constraint(equalTo: anotherView.centerYAnchor, constant: offset).isActive = true
        }
        return self
    }
    
    //MARK: Center in superview
    
    /// Centers the given axis of the view in its superview with offset.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter axis: Axis to center
    /// - Parameter offset: Axis offset
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func centerInSuperview(_ axis: ESLAxis, withOffset offset: CGFloat = .zero) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, axis: axis, withOffset: offset)
        return self
    }
    
    /// Centers the view in its superview with offset.
    ///
    /// To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: View should have superview, otherwise this method will have no effect.
    ///
    /// - Parameter offset: Axis offset.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func centerInSuperview(withOffset offset: ESLOffset = .zero) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, withOffset: offset)
        return self
    }
}
