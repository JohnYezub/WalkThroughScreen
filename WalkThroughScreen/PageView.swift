//
//  PageView.swift
//  WalkThroughScreen
//
//  Created by   admin on 04.10.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation
import UIKit


// view with text label
class PageView: UIView {
    
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      setup()
    }

//setup background and label position
    private func setup() {
        
        backgroundColor = .cyan
        
        textLabel.textColor = .darkGray
        self.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
