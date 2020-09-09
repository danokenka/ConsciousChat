//
//  GreetingViewController.swift
//  ConsciousChat
//
//  Created by Dan O on 9/9/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//

import UIKit
import CLTypingLabel

class GreetingViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: CLTypingLabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    titleLabel.text = "🤯Conscious Chat🌎"
    
    
    
//    titleLabel.text = ""
//    var charIndex = 0.0
//    let titleText = "🤯Conscious Chat🌎"
//    for letter in titleText {
//      print("-")
//      print(0.1 * charIndex)
//      print(letter)
//      Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
//        self.titleLabel.text?.append(letter)
//      }
//      charIndex += 1
//    }
//
  }
  
  
}
