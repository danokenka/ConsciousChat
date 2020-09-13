//
//  LoginViewController.swift
//  ConsciousChat
//
//  Created by Dan O on 9/9/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//


import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

  // Oulets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

 // @IBOutlet weak var firebaseWarnLogin: UILabel!
  
  var errorMessage = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emailTextfield.delegate = self
    passwordTextfield.delegate = self
  }
  
  
  @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                  
                    self.errorMessage = e.localizedDescription
//                    print(e.localizedDescription)
//                    self.firebaseWarnLogin.text = "Error: " + self.errorMessage
                  
                    let alert = UIAlertController(title: "Error", message: self.errorMessage, preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                  self.present(alert, animated: true)
                  
                } else {
                  self.performSegue(withIdentifier: K.loginSegue, sender: self)
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




