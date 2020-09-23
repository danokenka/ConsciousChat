//
//  ChatViewController.swift
//  ConsciousChat
//
//  Created by Dan O on 9/9/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//

import UIKit
import Firebase
import SwiftUI

class ChatViewController: UIViewController, UITextFieldDelegate {
  
  //Outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var messageTextfield: UITextField!
  
  let db = Firestore.firestore()
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
    
    loadMessages()
    
  }
  
  func loadMessages() {

    db.collection(K.FStore.collectionName)
      .order(by: K.FStore.dateField)
      .addSnapshotListener { (querySnapshot, error) in
        
      self.messages = []
        
      if let e = error {
            print("There was an issue retrieving data from Firestore. \(e)")
      } else {
        if let snapshotDocuments = querySnapshot?.documents {
          for doc in snapshotDocuments {
           let data = doc.data()
            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
              let newMessage = Message(sender: messageSender, body: messageBody)
              self.messages.append(newMessage)
              
              DispatchQueue.main.async {
                self.tableView.reloadData()
              }
              
            }
          }
        }
      }
    
//    db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
//      if let e = error {
//            print("THere was an issue retrieving data from Firestore. \(e)")
//      } else {
//        if let snapshotDocuments = querySnapshot?.documents {
//          for doc in snapshotDocuments {
//           let data = doc.data()
//            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
//              let newMessage = Message(sender: messageSender, body: messageBody)
//              self.messages.append(newMessage)
//
//              DispatchQueue.main.async {
//                self.tableView.reloadData()
//              }
//
//            }
//          }
//        }
//      }
  
    }
  }
  

  @IBAction func sendPressed(_ sender: UIButton) {
    if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
      db.collection(K.FStore.collectionName).addDocument(data: [
        K.FStore.senderField: messageSender,
        K.FStore.bodyField: messageBody,
        K.FStore.dateField: Date().timeIntervalSince1970
      ]) { (error) in
          if let e = error {
            print("There was an issue saving data to firestore, \(e)")
          } else {
            print("Successfully saved data.")
          }
      }
    }
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
    let message = messages[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
      as! MessageCell
    cell.label.text = messages[indexPath.row].body
    
    // Message from Current Logged In user
    if message.sender == Auth.auth().currentUser?.email {
      cell.leftImageView.isHidden = true
      cell.rightImageView.isHidden = false
      cell.messageBubble.backgroundColor = UIColor.lightBrandColor
      cell.label.textColor = UIColor.darkText
    }
    
    // Mwssage from User not currently logged in
    else {
      cell.leftImageView.isHidden = false
      cell.rightImageView.isHidden = true
      cell.messageBubble.backgroundColor = UIColor.brandColorDark
      cell.label.textColor = UIColor.white 
    }
    
    
    
    
    
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

struct ChatViewController_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}


