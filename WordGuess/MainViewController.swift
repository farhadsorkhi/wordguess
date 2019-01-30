//
//  ViewController.swift
//  WordGuess
//
//  Created by Amin on 1/28/19.
//  Copyright © 2019 farhad. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let words: [String: [Word]] = [
        "Easy": [.boy("john")],
        "Normal": [.city("tehran") , .city("Iran")],
        "Hard": [.girl("jennifer")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton, segue.identifier == "Start Game" {
            let wordCandidates = words[button.currentTitle!]!
            let index = Int.random(in: wordCandidates.indices)
            if let gvc = segue.destination as? GameViewController {
                gvc.word = wordCandidates[index]
            }
        }
    }
}

enum Word{
    var type: String {
        switch self {
            case .country:
                return "Country"
            case .city:
                return "City"
            case .boy:
                return "Boy Name"
            case .girl:
                return "Girl Name"
        }
    }
    var string: String {
        switch self {
        case .country(let string):
            return string
        case .city(let string):
            return string
        case .boy(let string):
            return string
        case .girl(let string):
            return string
        }
    }
    case country(String)
    case city(String)
    case boy(String)
    case girl(String)
    
}
