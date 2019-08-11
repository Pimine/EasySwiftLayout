//
//  UIView + Pin.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/11/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

public extension UIView {
    
    func pin(
        topTo top: NSLayoutYAxisAnchor? = nil,
        leftTo left: NSLayoutXAxisAnchor? = nil,
        bottomTo bottom: NSLayoutYAxisAnchor? = nil,
        rightTo right : NSLayoutXAxisAnchor? = nil,
        withMargins margins: UIEdgeInsets = .zero
    ) {
        if top == nil && left == nil && bottom == nil, right == nil {
            fatalError("You should pass at least one anchor")
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: margins.top).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: margins.left).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -margins.bottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -margins.right).isActive = true
        }
    }
    
    func pin(
        topTo top: ESLEdge? = nil, ofView topView: UIView? = nil,
        leftTo left: ESLEdge? = nil, ofView leftView: UIView? = nil,
        bottomTo bottom: ESLEdge? = nil, ofView bottomView: UIView? = nil,
        rightTo right : ESLEdge? = nil, ofView rightView: UIView? = nil,
        withMargins margins: UIEdgeInsets = .zero
    ) {
        if top == nil && left == nil && bottom == nil, right == nil {
            fatalError("You should pass at least one edge")
        }
        
        if let top = top {
            let topView = Utils.tryForceUnwrap(view: topView, failMessage: "You should pass pinning view with edge")
            let anchor = top.convertToNSLayoutYAnchor(ofView: topView)
            topAnchor.constraint(equalTo: anchor, constant: margins.top).isActive = true
        }
        
        if let left = left {
            let leftView = Utils.tryForceUnwrap(view: leftView, failMessage: "You should pass pinning view with edge")
            let anchor = left.convertToNSLayoutXAnchor(ofView: leftView)
            leftAnchor.constraint(equalTo: anchor, constant: margins.left).isActive = true
        }
        
        if let bottom = bottom {
            let bottomView = Utils.tryForceUnwrap(view: bottomView, failMessage: "You should pass pinning view with edge")
            let anchor = bottom.convertToNSLayoutYAnchor(ofView: bottomView)
            bottomAnchor.constraint(equalTo: anchor, constant: -margins.bottom).isActive = true
        }
        
        if let right = right {
            let rightView = Utils.tryForceUnwrap(view: rightView, failMessage: "You should pass pinning view with edge")
            let anchor = right.convertToNSLayoutXAnchor(ofView: rightView)
            rightAnchor.constraint(equalTo: anchor, constant: -margins.right).isActive = true
        }
    }
    
    func pinEdge(_ edge: ESLEdge, to pinningEdge: ESLEdge, ofView view: UIView, withMargin margin: CGFloat = .zero) {
        switch edge {

        case .left, .right:
            let anchor = edge.convertToNSLayoutXAnchor(ofView: self)
            let pinningAnchor = pinningEdge.convertToNSLayoutXAnchor(ofView: view)
            anchor.constraint(equalTo: pinningAnchor, constant: margin)

        case .top, .bottom:
            let anchor = edge.convertToNSLayoutYAnchor(ofView: self)
            let pinningAnchor = pinningEdge.convertToNSLayoutYAnchor(ofView: view)
            anchor.constraint(equalTo: pinningAnchor, constant: margin)
        }
    }
    
    func pin(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfView view: UIView, withMargins margins: UIEdgeInsets = .zero) {
        for edge in edges {
            switch edge {
            case .left:
                pinEdge(.left, to: .left, ofView: view, withMargin: margins.left)
            case .right:
                pinEdge(.right, to: .right, ofView: view, withMargin: margins.right)
            case .top:
                pinEdge(.top, to: .top, ofView: view, withMargin: margins.top)
            case .bottom:
                pinEdge(.bottom, to: .bottom, ofView: view, withMargin: margins.bottom)
            }
        }
    }
    
    func pinToSuperview(_ edges: [ESLEdge] = ESLEdge.all, withMargins margins: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        pin(edges, toSameEdgesOfView: superview, withMargins: margins)
    }
}
