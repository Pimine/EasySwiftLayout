//
//  Deprecated.swift
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

import Foundation

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
    
    @available(*, deprecated, renamed: "width(_:usingRelation:priority:)")
    @discardableResult
    func width(
        _ relation: NSLayoutRelation, to width: CGFloat,
        priority: UILayoutPriority = .required
    ) -> Self {
        self.width(width, usingRelation: relation, priority: priority)
        return self
    }
    
    @available(*, deprecated, renamed: "height(_:usingRelation:priority:)")
    @discardableResult
    func height(
        _ relation: NSLayoutRelation, to height: CGFloat,
        priority: UILayoutPriority = .required
    ) -> Self {
        self.height(height, usingRelation: relation, priority: priority)
        return self
    }
    
    @available(*, deprecated, renamed: "size(_:usingRelation:priority:)")
    @discardableResult
    func size(_ relation: NSLayoutRelation, to size: CGSize, priority: UILayoutPriority = .required) -> Self {
        self.size(size, usingRelation: relation, priority: priority)
    }
    
    @available(*, deprecated, renamed: "size(toSquareWithSide:usingRelation:priority:)")
    @discardableResult
    func size(
        _ relation: NSLayoutRelation = .equal,
        toSquareWithSide side: CGFloat,
        priority: UILayoutPriority = .required
    ) -> Self {
        size(toSquareWithSide: side, usingRelation: relation, priority: priority)
        return self
    }
}
