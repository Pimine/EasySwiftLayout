//
//  ESLSuperviewGuide.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 30.01.2020.
//  Copyright © 2020 Denis Andreychuk. All rights reserved.
//

import Foundation

public enum ESLSuperviewGuide {
    
    // MARK: - Cases
    
    case none
    
    case layoutMargins
    
    case readableContent
    
    @available(iOS 11.0, *)
    case safeAreaLayout
    
    // MARK: - Properties
    
    func convertedToESLGuide(superview: UIView) -> ESLGuide? {
        switch self {
        case .none:
            return nil
        case .layoutMargins:
            return .layoutMargins(of: superview)
        case .readableContent:
            return .readableContent(of: superview)
        case .safeAreaLayout:
            guard #available(iOS 11.0, *) else {
                fatalError("Safe area layout guide available from IOS 11.0")
            }
            return .safeAreaLayout(of: superview)
        }
    }
}
