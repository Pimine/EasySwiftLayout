//
//  Utils.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/11/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation

class Utils {
    
    static let shared = Utils()
    private init() { }
    
    static func tryForceUnwrap(view: UIView?, failMessage: String) -> UIView {
        guard let view = view else {
            fatalError(failMessage)
        }
        return view
    }
}
