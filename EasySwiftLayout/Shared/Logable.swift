//
//  Logger.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 8/25/19.
//  Copyright © 2019 Денис Андрейчук. All rights reserved.
//

import Foundation


protocol Logable {
    func log(_ message: String)
}

extension Logable where Self: UIView {
    func log(_ message: String) {
        print("[EasySwiftLayout] \(message)")
    }
}

extension UIView: Logable { }

