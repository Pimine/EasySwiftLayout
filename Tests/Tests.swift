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
@testable import EasySwiftLayout

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
    
    func verify(
        _ anotherView: UIView,
        hasPinnedEdges edges: [ESLEdge],
        to container: UIView,
        withInsets edgeInsets: UIEdgeInsets,
        relation: NSLayoutConstraint.Relation = .greaterThanOrEqual,
        priority: UILayoutPriority = .defaultLow
    ) {
        let insets: [ESLEdge: CGFloat] = [
            .top: edgeInsets.top,
            .left: edgeInsets.left,
            .bottom: edgeInsets.bottom,
            .right: edgeInsets.right
        ]
        for (index, edge) in edges.enumerated() {
            verify(
                container.constraints[index],
                firstItem: anotherView,
                secondItem: container,
                constant: insets[edge]! * edge.directionalMultiplier,
                relation: relation,
                priority: priority
            )
            XCTAssertNotNil(container.constraints.first {
                $0.firstAttribute == edge.convertedToNSLayoutAttribute &&
                $0.secondAttribute == edge.convertedToNSLayoutAttribute
            })
        }
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
        
        // 1
        
        verify(container.constraints[0], firstItem: container)
        XCTAssertEqual(container.constraints[0].firstAttribute, .height)
        
        // 2
        
        verify(container.constraints[1], firstItem: container)
        XCTAssertEqual(container.constraints[1].firstAttribute, .width)
    }
    
    func testSizeToSquareWithSide() {
        container.size(toSquareWithSide: 10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        // 1
        
        verify(container.constraints[0], firstItem: container)
        XCTAssertEqual(container.constraints[0].firstAttribute, .height)
        
        // 2
        
        verify(container.constraints[1], firstItem: container)
        XCTAssertEqual(container.constraints[1].firstAttribute, .width)
    }
    
    // MARK: - Size using another view
    
    func testWidthUsingAnotherView() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)

        anotherView.width(match: container, withInset: 10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 1)
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: container, constant: -10)
        XCTAssertEqual(container.constraints[0].firstAttribute, .width)
    }
    
    func testHeightUsingAnotherView() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)

        anotherView.height(match: container, withInset: 10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 1)
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: container, constant: -10)
        XCTAssertEqual(container.constraints[0].firstAttribute, .height)
    }
    
    func testSizeUsingAnotherView() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)

        anotherView.size(match: container, withInset: 10, usingRelation: .greaterThanOrEqual, priority: .defaultLow)
        XCTAssertTrue(container.constraints.count == 2)
        
        // 1
        
        verify(container.constraints[0], firstItem: anotherView, secondItem: container, constant: -10)
        XCTAssertEqual(container.constraints[0].firstAttribute, .width)
        
        // 2
        
        verify(container.constraints[1], firstItem: anotherView, secondItem: container, constant: -10)
        XCTAssertEqual(container.constraints[1].firstAttribute, .height)
    }
    
    // MARK: - Pin view to another view
    
    func testPinEdgesToSameEdgesOfViewExcludingEdgeWithInset() {
        for excludedEdge in ESLEdge.all {
            let edges = ESLEdge.all.filter { $0 != excludedEdge }
            
            let anotherView = UIView()
            anotherView.add(toSuperview: container)
            
            anotherView.pinEdges(
                toSameEdgesOfView: container,
                excludingEdge: excludedEdge,
                withInset: 10,
                usingRelation: .greaterThanOrEqual,
                priority: .defaultLow
            )
            XCTAssertTrue(container.constraints.count == 3)
            
            // 1
            
            verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: UIEdgeInsets(inset: 10))
            
            // Finally
            
            anotherView.removeFromSuperview()
        }
    }
    
    func testPinEdgesToSameEdgesOfViewExcludingEdgeWithInsets() {
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        for excludedEdge in ESLEdge.all {
            let anotherView = UIView()
            anotherView.add(toSuperview: container)
            
            anotherView.pinEdges(
                toSameEdgesOfView: container,
                excludingEdge: excludedEdge,
                withInsets: insets,
                usingRelation: .greaterThanOrEqual,
                priority: .defaultLow
            )
            XCTAssertTrue(container.constraints.count == 3)
            
            // 1
            
            let edges = ESLEdge.all.filter { $0 != excludedEdge }
            verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: insets)
            
            // Finally
            
            anotherView.removeFromSuperview()
        }
    }
    
    func testPinEdgesOfGroupToSameEdgesOfViewWithInset() {
        for group in [ESLEdgeGroup.horizontal, ESLEdgeGroup.vertical] {
            let anotherView = UIView()
            anotherView.add(toSuperview: container)
            
            anotherView.pinEdges(
                ofGroup: group,
                toSameEdgesOfView: container,
                withInset: 10,
                usingRelation: .greaterThanOrEqual,
                priority: .defaultLow
            )
            XCTAssertTrue(container.constraints.count == 2)
            
            // 1
            
            let edges = group.edges
            verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: UIEdgeInsets(inset: 10))
            
            // Finally
            
            anotherView.removeFromSuperview()
        }
    }
    
    func testPinEdgesToSameEdgesOfViewWithInset() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        anotherView.pinEdges(
            toSameEdgesOfView: container,
            withInset: 10,
            usingRelation: .greaterThanOrEqual,
            priority: .defaultLow
        )
        XCTAssertTrue(container.constraints.count == 4)
        
        verify(anotherView, hasPinnedEdges: ESLEdge.all, to: container, withInsets: UIEdgeInsets(inset: 10))
    }
    
    func testPin() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        anotherView.pin(
            topTo: container.topAnchor,
            leftTo: container.leftAnchor,
            bottomTo: container.bottomAnchor,
            rightTo: container.rightAnchor,
            withInsets: insets,
            priority: .defaultLow
        )
        XCTAssertTrue(container.constraints.count == 4)
        let edges: [ESLEdge] = [.top, .left, .bottom, .right]
        verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: insets, relation: .equal)
    }
    
    // MARK: - Pin view to superview
    
    func testPinEdgesToSuperviewExcludingEdgeWithInset() {
        for excludedEdge in ESLEdge.all {
            let edges = ESLEdge.all.filter { $0 != excludedEdge }
            
            let anotherView = UIView()
            anotherView.add(toSuperview: container)
            
            anotherView.pinEdgesToSuperview(
                excludingEdge: excludedEdge,
                withInset: 10,
                usingRelation: .greaterThanOrEqual,
                priority: .defaultLow
            )
            XCTAssertTrue(container.constraints.count == 3)
            
            // 1
            
            verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: UIEdgeInsets(inset: 10))
            
            // Finally
            
            anotherView.removeFromSuperview()
        }
    }
    
    func testPinEdgesToSuperviewExcludingEdgeWithInsets() {
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        for excludedEdge in ESLEdge.all {
            let anotherView = UIView()
            anotherView.add(toSuperview: container)
            
            anotherView.pinEdgesToSuperview(
                excludingEdge: excludedEdge,
                withInsets: insets,
                usingRelation: .greaterThanOrEqual,
                priority: .defaultLow
            )
            XCTAssertTrue(container.constraints.count == 3)
            
            // 1
            
            let edges = ESLEdge.all.filter { $0 != excludedEdge }
            verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: insets)
            
            // Finally
            
            anotherView.removeFromSuperview()
        }
    }
    
    func testPinEdgesToSuperviewOfGroupWithInset() {
        for group in [ESLEdgeGroup.horizontal, ESLEdgeGroup.vertical] {
            let anotherView = UIView()
            anotherView.add(toSuperview: container)
            
            anotherView.pinEdgesToSuperview(
                ofGroup: group,
                withInset: 10,
                usingRelation: .greaterThanOrEqual,
                priority: .defaultLow
            )
            XCTAssertTrue(container.constraints.count == 2)
            
            // 1
            
            let edges = group.edges
            verify(anotherView, hasPinnedEdges: edges, to: container, withInsets: UIEdgeInsets(inset: 10))
            
            // Finally
            
            anotherView.removeFromSuperview()
        }
    }
    
    func testPinEdgesToSuperviewWithInset() {
        let anotherView = UIView()
        anotherView.add(toSuperview: container)
        
        anotherView.pinEdgesToSuperview(
            withInset: 10,
            usingRelation: .greaterThanOrEqual,
            priority: .defaultLow
        )
        XCTAssertTrue(container.constraints.count == 4)
        
        verify(anotherView, hasPinnedEdges: ESLEdge.all, to: container, withInsets: UIEdgeInsets(inset: 10))
    }
}
