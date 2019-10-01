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
    
    /// Sets view's width to a specific size.
    ///
    /// 1. Constraints width anchor using `NSLayoutConstraint` to a specific size.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass non-zero size, otherwise this method will have no effect.
    ///
    /// - Parameter size: The size to set this view's width to.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func width(_ size: CGFloat) -> Self {
        guard size != 0 else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
        return self
    }
    
    /// Sets view's height to a specific size.
    ///
    /// 1. Constraints height anchor using `NSLayoutConstraint` to a specific size.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass non-zero size, otherwise this method will have no effect.
    ///
    /// - Parameter size: The size to set this view's height to.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func height(_ size: CGFloat) -> Self{
        guard size != 0 else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: size).isActive = true
        return self
    }
    
    /// Sets view's dimensions to a specific size.
    ///
    /// 1. Constraints width and height anchors using `NSLayoutConstraint` to a specific size.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass non-zero size, otherwise this method will have no effect.
    ///
    /// - Parameter size: The size to set this view's dimensions to.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func size(_ size: CGSize) -> Self {
        guard size != .zero else { return self }
        if size.height != 0 {
            height(size.height)
        }
        if size.width != 0 {
            width(size.width)
        }
        return self
    }
    
    /// Sets view's dimensions to square with side.
    ///
    /// 1. Constraints width and height anchors using `NSLayoutConstraint` to match square size.
    /// 2. To make Auto-Layout works properly, it automatically sets view's property
    /// `translatesAutoresizingMaskIntoConstraints` to `false`
    ///
    /// - Precondition: Pass non-zero side, otherwise this method will have no effect.
    ///
    /// - Parameter side: Square side to set this view's dimensions to.
    ///
    /// - Returns: `self` with attribute `@discardableResult`.
    ///
    @discardableResult func size(toSquareWithSide side: CGFloat) -> Self {
        guard side != .zero else { return self }
        size(.init(width: side, height: side))
        return self
    }
}
