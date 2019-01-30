//
//  GameViewController.swift
//  WordGuess
//
//  Created by Amin on 1/28/19.
//  Copyright © 2019 farhad. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var wordStackView: UIStackView!
    @IBOutlet weak var falseStackView: UIStackView!
    
    @IBOutlet weak var firstKeyboardStackView: UIStackView!
    @IBOutlet weak var secondKeyboardStackView: UIStackView!
    @IBOutlet weak var thirdKeyboardStackView: UIStackView!
    
    let winAlert = UIAlertController(title: "Victory", message: "You Won!", preferredStyle: .alert)
    let lostAlert = UIAlertController(title: "Lost", message: "You Lost :(", preferredStyle: .alert)
    
    var word = Word.city("tehran")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = word.type
        for _ in word.string.uppercased() {
            let wordLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            wordLabel.font = UIFont.systemFont(ofSize: 30)
            wordLabel.text = "_"
            wordStackView.addArrangedSubview(wordLabel)
            
            let falseLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            wordLabel.font = UIFont.systemFont(ofSize: 30)
            falseLabel.layer.borderColor = UIColor.green.cgColor
            falseLabel.layer.borderWidth = 2
            falseLabel.text = " "
            falseStackView.addArrangedSubview(falseLabel)
        }
        var keyboardLetters = Array(word.string.uppercased())
        var alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").filter({ !keyboardLetters.contains($0) })
        for _ in 0..<word.string.count * 2 {
            keyboardLetters.append(alphabet.remove(at: Int.random(in: alphabet.indices)))
        }
        keyboardLetters.shuffle()
        for (index, letter) in keyboardLetters.enumerated() {
            let button = UIButton(type: .system)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
            button.setTitle(String(letter), for: .normal)
            button.addTarget(self, action: #selector(touchLetter), for: .touchUpInside)
            if index < keyboardLetters.count / 3 {
                firstKeyboardStackView.addArrangedSubview(button)
            } else if index >= keyboardLetters.count / 3, index < 2 * keyboardLetters.count / 3 {
                secondKeyboardStackView.addArrangedSubview(button)
            } else {
                thirdKeyboardStackView.addArrangedSubview(button)
            }
        }
        
    }

    @objc func touchLetter(sender: UIButton) {
        let wordArray = Array(word.string.uppercased()).map({ String($0) })
        var contained = false
        for (index, letter) in wordArray.enumerated() {
            if letter == sender.currentTitle! {
                contained = true
                (wordStackView.arrangedSubviews[index] as! UILabel).text = letter
            }
        }
        if contained == false {
            for (index, view) in falseStackView.arrangedSubviews.enumerated() {
                let label = view as! UILabel
                if label.text == " " {
                    label.layer.borderWidth = 0
                    label.text = "❌"
                    if index == falseStackView.arrangedSubviews.count - 1 {
                        self.present(lostAlert, animated: true, completion: nil)
                    }
                    break
                }
            }
        }
        if contained == true {
            var won = true
            for view in wordStackView.arrangedSubviews {
                let label = view as! UILabel
                if label.text == "_" {
                    won = false
                }
            }
            if won {
                self.present(winAlert, animated: true, completion: nil)
            }
        }
    }
    
}
