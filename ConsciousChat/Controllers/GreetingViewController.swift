//
//  GreetingViewController.swift
//  ConsciousChat
//
//  Created by Dan O on 9/9/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBAction func loginButtonPressed(_ sender: Any) {
       //  loginButtonPressedSegue()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelFunc()
  }
  
  func loginButtonPressedSegue() {
     self.performSegue(withIdentifier: "ToLogin", sender: self)
  }
  
  func labelFunc() {
    titleLabel.text = ""
    var charIndex = 0.0
    let titleText = K.appName
    for letter in titleText {
      print("-")
      print(0.1 * charIndex)
      print(letter)
      Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
        self.titleLabel.text?.append(letter)
      }
      charIndex += 1
    }
    
  }
  
}
