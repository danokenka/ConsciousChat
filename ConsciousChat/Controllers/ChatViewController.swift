//
//  ChatViewController.swift
//  ConsciousChat
//
//  Created by Dan O on 9/9/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITextFieldDelegate {
  
  //Outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var messageTextfield: UITextField!
  
  var messages:[Message] = [
    Message(sender: "abc@bca.com", body: "Hello duder mcgavin"),
    Message(sender: "def@bca.com", body: "Whats up Brohemien Rhapsoda"),
    Message(sender: "abc@bca.com", body: "Chillaxin till the next swell"),
    Message(sender: "def@bca.com", body: "Sick Bruh")
  ]
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    messageTextfield.delegate = self
    title = K.appName
    navigationItem.hidesBackButton = true
    
    tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    
  }
  
  @IBAction func sendPressed(_ sender: UIButton) {
  }
  
  
  @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
    let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
      navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
    
  }
  
  
  //. UITExtFieldDlegeate methods
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    messageTextfield.resignFirstResponder()
    return true
  }
  
}


extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
      as! MessageCell
    cell.label.text = messages[indexPath.row].body
    return cell
  }
  
  
}

extension ChatViewController: UITableViewDelegate {
  
//  // REALLY Helpful Prints index path to console
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//      print(indexPath.row)
//  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print(indexPath.row)
  }

  
}
