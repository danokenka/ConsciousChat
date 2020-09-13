//
//  RegisterViewController.swift
//  ConsciousChat
//
//  Created by Dan O on 9/9/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {


  @IBOutlet weak var emailTextfield: UITextField!
  
  @IBOutlet weak var passwordTextfield: UITextField!
  
  var errorMessage = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emailTextfield.delegate = self
    passwordTextfield.delegate = self
  }
  
  
  @IBAction func registerPressed(_ sender: UIButton) {
    if let email = emailTextfield.text, let password = passwordTextfield.text {
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if let e = error {
        self.errorMessage = e.localizedDescription
          //                    print(e.localizedDescription)
          //                    self.firebaseWarnLogin.text = "Error: " + self.errorMessage
                            
                              let alert = UIAlertController(title: "Error", message: self.errorMessage, preferredStyle: .alert)

                              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
          //                  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                            self.present(alert, animated: true)
        } else {
          //Navigate to the ChatViewController
          self.performSegue(withIdentifier: K.registerSegue, sender: self)
        }
      }
    }

  }
  
  
  
  //. UITExtFieldDlegeate methods
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    emailTextfield.resignFirstResponder()
    passwordTextfield.resignFirstResponder()
    return true
  }
  
  
  
}
