//
//  ESLGuide.swift
//  EasySwiftLayout
//
//  Created by Денис Андрейчук on 24.01.2020.
//  Copyright © 2020 Denis Andreychuk. All rights reserved.
//

import UIKit

public enum ESLGuide {
    
    // MARK: - Cases
    
    case custom(UILayoutGuide)
    
    case layoutMargins(of: UIView)
    
    case readableContent(of: UIView)
    
    @available(iOS 11.0, *)
    case safeAreaLayout(of: UIView)
    
    // MARK: - Properties
    
    public var layoutGuide: UILayoutGuide {
        switch self {
            
        // Custom Layout Guide
            
        case .custom(let layoutGuide):
            return layoutGuide
            
        // Layout Margins Guide
            
        case .layoutMargins(let view):
            return view.layoutMarginsGuide
            
        // Readable Content Guide
            
        case .readableContent(let view):
            return view.readableContentGuide
            
        // Safe Area Layout Guide
            
        case .safeAreaLayout(let view):
            guard #available(iOS 11.0, *) else {
                fatalError("Safe area layout guide available from IOS 11.0")
            }
            return view.safeAreaLayoutGuide
        }
    }
}
