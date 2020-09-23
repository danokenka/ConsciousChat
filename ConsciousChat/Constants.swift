//
//  Constants.swift
//  ConsciousChat
//
//  Created by Dan O on 9/11/20.
//  Copyright © 2020 People Like Us LLC. All rights reserved.
//
import SwiftUI
// struct Constants changed to K for shorthand
struct K {
  static let registerSegue = "RegisterToChat"
  static let loginSegue = "LoginToChat"
  
  static let appName = "🤯Conscious Chat🌎"
  
  static let cellIdentifier = "ReuseableCell"
  
  static let cellNibName = "MessageCell"
  
  struct BrandColors {
  static let lightBrandColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
  }
  
  let brandColorLight = Color(red: 180.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0)
  let brandColor = Color(red: 128.0 / 255.0, green: 222.0 / 255.0, blue: 234.0 / 255.0)
  let brandColorDark = Color(red: 75.0 / 255.0, green: 172.0 / 255.0, blue: 184.0 / 255.0)
  
  struct FStore {
    static let collectionName = "messages"
    static let senderField = "sender"
    static let bodyField = "body"
    static let dateField = "date"
  }
  
  
  
}


extension UIColor {

  static let lightBrandColor = UIColor(displayP3Red: 180.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 5.0)
  static let brandColor = UIColor(displayP3Red: 128.0 / 255.0, green: 222.0 / 255.0, blue: 234.0 / 255.0, alpha: 5.0)
   static let brandColorDark = UIColor(displayP3Red: 75.0 / 255.0, green: 172.0 / 255.0, blue: 184.0 / 255.0, alpha: 5.0)
   

}


