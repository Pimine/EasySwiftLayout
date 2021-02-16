//
//  Deprecated.swift
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

import UIKit

@available(*, deprecated, message: "`ESL2DimensionalInsets` deprecated and replaced with `ESLSizeInsets`")
typealias ESL2DimensionalInsets = CGSize

@available(*, deprecated, message: "`ESLOffset` deprecated and replaced with `UIOffset`")
public struct ESLOffset {

    public let x: CGFloat
    public let y: CGFloat

    public static let zero = ESLOffset(x: 0, y: 0)

    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
}

// MARK: - Pin Methods

public extension UIView {
    
    @available(*, deprecated, renamed: "pinEdgesToSuperview(ofGroup:usingRelation:withInset:priority:)")
    func pinHorizontalEdgesToSuperview(withInset inset: CGFloat = .zero) {
        pinEdgesToSuperview(ofGroup: .horizontal, withInset: inset)
    }
    
    @available(*, deprecated, renamed: "pinEdgesToSuperview(ofGroup:usingRelation:withInset:priority:)")
    func pinVerticalEdgesToSuperview(withInset inset: CGFloat = .zero) {
        pinEdgesToSuperview(ofGroup: .vertical, withInset: inset)
    }
}

// MARK: - Size Methods

public extension UIView {
    
    @available(*, deprecated, renamed: "width(match:withInset:usingRelation:priority:)")
    @discardableResult
    func width(
        to anotherView: UIView,
        withInset inset: CGFloat = .zero,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        width(match: anotherView, withInset: inset, usingRelation: relation, priority: priority)
    }
    @available(*, deprecated, renamed: "height(match:withInset:usingRelation:priority:)")
    @discardableResult
    func height(
        to anotherView: UIView,
        withInset inset: CGFloat = .zero,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        height(match: anotherView, withInset: inset, usingRelation: relation, priority: priority)
    }
    
    @available(*, deprecated, renamed: "size(match:withInsets:usingRelation:priority:)")
    @discardableResult
    func size(
        to anotherView: UIView,
        withInsets insets: ESLSizeInsets = .zero,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        size(match: anotherView, withInsets: insets, usingRelation: relation, priority: priority)
    }
    
    @available(*, deprecated, renamed: "size(match:withInset:usingRelation:priority:)")
    @discardableResult
    func size(
        to anotherView: UIView,
        withInset inset: CGFloat = .zero,
        usingRelation relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        size(match: anotherView, withInset: inset, usingRelation: relation, priority: priority)
    }
    
    
    @available(*, deprecated, renamed: "width(_:usingRelation:priority:)")
    @discardableResult
    func width(
        _ relation: NSLayoutConstraint.Relation, to width: CGFloat,
        priority: UILayoutPriority = .required
    ) -> Self {
        self.width(width, usingRelation: relation, priority: priority)
        return self
    }
    
    @available(*, deprecated, renamed: "height(_:usingRelation:priority:)")
    @discardableResult
    func height(
        _ relation: NSLayoutConstraint.Relation, to height: CGFloat,
        priority: UILayoutPriority = .required
    ) -> Self {
        self.height(height, usingRelation: relation, priority: priority)
        return self
    }
    
    @available(*, deprecated, renamed: "size(_:usingRelation:priority:)")
    @discardableResult
    func size(_ relation: NSLayoutConstraint.Relation, to size: CGSize, priority: UILayoutPriority = .required) -> Self {
        self.size(size, usingRelation: relation, priority: priority)
    }
    
    @available(*, deprecated, renamed: "size(toSquareWithSide:usingRelation:priority:)")
    @discardableResult
    func size(
        _ relation: NSLayoutConstraint.Relation,
        toSquareWithSide side: CGFloat,
        priority: UILayoutPriority = .required
    ) -> Self {
        size(toSquareWithSide: side, usingRelation: relation, priority: priority)
        return self
    }
}

// MARK: - Center Methods

public extension UIView {
    
    @available(*, deprecated, renamed: "centerInSuperview(axis:withOffset:priority:)")
    @discardableResult
    func centerInSuperview(
        _ axis: ESLAxis,
        withOffset offset: CGFloat = .zero,
        priority: UILayoutPriority = .required
    ) -> Self {
        centerInSuperview(axis: axis)
    }
    
    @available(*, deprecated)
    @discardableResult
    func centerInView(
        _ anotherView: UIView,
        withOffset offset: ESLOffset,
        priority: UILayoutPriority = .required
    ) -> Self {
        centerInView(anotherView, axis: .horizontal, withOffset: offset.x, priority: priority)
        centerInView(anotherView, axis: .vertical, withOffset: offset.y, priority: priority)
        
        return self
    }
    
    @available(*, deprecated)
    @discardableResult
    func centerInSuperview(withOffset offset: ESLOffset, priority: UILayoutPriority = .required) -> Self {
        guard let superview = superview else { return self }
        centerInView(superview, withOffset: offset, priority: priority)
        return self
    }
}
