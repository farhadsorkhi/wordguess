//
//  GameView.swift
//  WordGuess
//
//  Created by Amin on 1/28/19.
//  Copyright © 2019 farhad. All rights reserved.
//

import UIKit

@IBDesignable
class GameView: UIView {
    
    var word = "Tehran"
    var type = "City"

    private lazy var wordStackView = createWordStackView()
    private lazy var falseStackView = createFalseStackView()
    
    private func createWordStackView() -> UIStackView {
        let stackView = UIStackView(frame: CGRect(origin: center, size: CGSize.zero))
        stackView.axis = .horizontal
        for letter in word {
            let button = UIButton(frame: CGRect(origin: center, size: CGSize(width: 30, height: 30)))
            button.setTitle(String(letter), for: .normal)
            stackView.addArrangedSubview(button)
        }
        addSubview(stackView)
        return stackView
    }
    
    private func createFalseStackView() -> UIStackView {
        return UIStackView(frame: CGRect(origin: center, size: CGSize.zero))
    }
    
    override func layoutSubviews() {
        wordStackView.center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        wordStackView.sizeToFit()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
