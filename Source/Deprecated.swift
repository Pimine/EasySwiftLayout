//
//  Deprecated.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 03.11.2019.
//  Copyright © 2019 Denis Andreychuk. All rights reserved.
//

import Foundation

extension UIView {
    
    @available(*, deprecated, renamed: "pinEdgesToSuperview(ofGroup:usingRelation:withInset:priority:)")
    func pinHorizontalEdgesToSuperview(withInset inset: CGFloat = .zero) {
        pinEdgesToSuperview(ofGroup: .horizontal, withInset: inset)
    }
    
    @available(*, deprecated, renamed: "pinEdgesToSuperview(ofGroup:usingRelation:withInset:priority:)")
    func pinVerticalEdgesToSuperview(withInset inset: CGFloat = .zero) {
        pinEdgesToSuperview(ofGroup: .vertical, withInset: inset)
    }
}
