//
//  Tests.swift
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

import XCTest
import EasySwiftLayout

class EasySwiftLayoutTests: XCTestCase {
    
    let container = UIView()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Helpers
    
    func testAddToSuperview() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        XCTAssertNotNil(anotherView.superview)
        XCTAssertEqual(anotherView.superview!, container)
    }
    
    func verify(
        _ constraint: NSLayoutConstraint,
        firstItem: UIView,
        secondItem: UIView? = nil,
        constant: CGFloat = 10,
        relation: NSLayoutConstraint.Relation = .greaterThanOrEqual,
        priority: UILayoutPriority = .defaultLow
    ) {
        XCTAssertTrue(constraint.firstItem === firstItem)
        if let secondItem = secondItem {
            XCTAssertTrue(constraint.secondItem === secondItem)
        }
        XCTAssertEqual(constraint.constant, constant)
        XCTAssertEqual(constraint.relation, relation)
        XCTAssertEqual(constraint.priority, priority)
    }
    
    //MARK: - Center in the given view
    
    func testCenterAxisInView() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        // 1
        
        anotherView.centerInView(container, axis: .horizontal, withOffset: 10, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 1)
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[0].firstAttribute, .centerX)
        
        // 2
        
        anotherView.centerInView(container, axis: .vertical, withOffset: 10, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        verify(container.constraints[1], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[1].firstAttribute, .centerY)
    }
    
    func testCenterInView() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        anotherView.centerInView(container, withOffset: UIOffset(horizontal: 10, vertical: 10), priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        // 1
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[0].firstAttribute, .centerX)
        
        // 2
        
        verify(container.constraints[1], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[1].firstAttribute, .centerY)
    }
    
    //MARK: - Center in superview
    
    func testCenterAxisInSuperview() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        // 1
        
        anotherView.centerInSuperview(axis: .horizontal, withOffset: 10, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 1)
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[0].firstAttribute, .centerX)
        
        // 2
        
        anotherView.centerInSuperview(axis: .vertical, withOffset: 10, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        verify(container.constraints[1], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[1].firstAttribute, .centerY)
    }
    
    func testCenterInSuperview() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        anotherView.centerInSuperview(withOffset: UIOffset(horizontal: 10, vertical: 10), priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        // 1
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[0].firstAttribute, .centerX)
        
        // 2
        
        verify(container.constraints[1], firstItem: anotherView, secondItem: anotherView.superview, relation: .equal)
        XCTAssertEqual(container.constraints[1].firstAttribute, .centerY)
    }
    
    // MARK: - Size using constants
    
    func testWidthUsingConstants() {
        container.width(10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 1)
        
        verify(container.constraints[0], firstItem: container)
        XCTAssertEqual(container.constraints[0].firstAttribute, .width)
    }
    
    func testHeightUsingConstants() {
        container.height(10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 1)
        
        verify(container.constraints[0], firstItem: container)
        XCTAssertEqual(container.constraints[0].firstAttribute, .height)
    }
    
    func testSizeUsingConstants() {
        container.size(CGSize(width: 10, height: 10), usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        verify(container.constraints[0], firstItem: container)
        XCTAssertEqual(container.constraints[0].firstAttribute, .height)
        
        verify(container.constraints[1], firstItem: container)
        XCTAssertEqual(container.constraints[1].firstAttribute, .width)
    }
    
    func testSizeToSquareWithSide() {
        container.size(toSquareWithSide: 10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        verify(container.constraints[0], firstItem: container)
        XCTAssertEqual(container.constraints[0].firstAttribute, .height)
        
        verify(container.constraints[1], firstItem: container)
        XCTAssertEqual(container.constraints[1].firstAttribute, .width)
    }
}
