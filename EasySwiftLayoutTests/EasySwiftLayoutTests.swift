//
//  EasySwiftLayoutTests.swift
//  EasySwiftLayoutTests
//
//  Created by Денис Андрейчук on 10/7/19.
//  Copyright © 2019 Denis Andreychuk. All rights reserved.
//

import XCTest
import EasySwiftLayout

class EasySwiftLayoutTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let viewController = UIViewController()
        print(viewController.view.frame)
        
        
        let anotherView = UIView()
        viewController.view.addSubview(anotherView)
        anotherView.pin(bottomTo: viewController.view.safeAreaLayoutGuide.bottomAnchor)
        //anotherView.pinEdge(.bottom, toEdge: .bottom, ofGuide: .safeArea(of: viewController.view))
        anotherView.pinEdgesToSuperview(excludingEdge: .bottom)
        
        anotherView.layoutIfNeeded()
        
        print(anotherView.frame)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
