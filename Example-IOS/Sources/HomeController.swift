//
//  HomeController.swift
//  https://github.com/denandreychuk/EasySwiftLayout
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Denis Andreychuk
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

import UIKit
import EasySwiftLayout

final class HomeController: UIViewController {
    
    // MARK: - User interface
    
    private let backgroundView = configure(UIView()) {
        $0.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.4941176471, blue: 0.4823529412, alpha: 1)
        $0.layer.cornerRadius = 84
        $0.layer.masksToBounds = true
    }
    
    private let container = configure(UIStackView()) {
        $0.spacing = 17
        $0.axis = .vertical
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 60, left: 25, bottom: 60, right: 25)
    }
    
    private let headerTitle = configure(UILabel()) {
        $0.textColor = #colorLiteral(red: 0.1490196078, green: 0.1333333333, blue: 0.431372549, alpha: 1)
        $0.text = "Discover"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 27, weight: .bold)
    }
    
    private let illustrationView = configure(UIImageView(image: #imageLiteral(resourceName: "illustration"))) {
        $0.layer.cornerRadius = 75
        $0.layer.masksToBounds = true
    }
    
    private let titleLabel = configure(UILabel()) {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.text = "Be Connected, Be Smart"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private let subtitleLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.text = "Join a community dedicated \nto keeping each other safe"
    }
    
    private let nextButton = configure(RoundedButton(type: .system)) {
        $0.tintColor = .white
        $0.backgroundColor = #colorLiteral(red: 0.8078431373, green: 0.3882352941, blue: 1, alpha: 1)
        $0.setTitle("Next", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    // MARK: - View controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addAndLayoutSubviews()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.addShadow(ofColor: #colorLiteral(red: 0.7607843137, green: 0.5176470588, blue: 0.568627451, alpha: 1), radius: 30, offset: CGSize(width: 0, height: 26))
    }
}

// MARK: - Layout UI

private extension HomeController {
    
    func addAndLayoutSubviews() {
        
        // Background
        
        backgroundView
            .add(toSuperview: view)
            .height(400)
            .centerInSuperview(axis: .y)
            .pinEdgesToSuperview(ofGroup: .horizontal, withInset: 25)
        
        // Container
        
        container
            .add(toSuperview: view)
            .pinEdges(toSameEdgesOfView: backgroundView, excludingEdge: .top)
            .addArrangedSubviews(illustrationView, titleLabel, subtitleLabel)
        
        container.setCustomSpacing(36, after: illustrationView)
        
        // Header label
        
        headerTitle
            .add(toSuperview: view)
            .pinEdgesToSuperview(excludingEdge: .bottom, withInset: 25, respectingGuide: .safeAreaLayout)
        
        // Next button
        
        nextButton
            .add(toSuperview: view)
            .centerInSuperview(axis: .x)
            .size(CGSize(width: 150, height: 55))
            .pinEdgeToSuperview(.bottom, withInset: 25, respectingGuide: .safeAreaLayout)
    }
}

