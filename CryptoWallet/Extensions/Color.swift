//
//  Color.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
  
  static let theme = ColorTheme()
  
}

struct ColorTheme {
  
  let corbeau = Color("Corbeau")
  let heatherGrey = Color("Heather Grey")
  let latinCharm = Color("Latin Charm")
  let greenMana = Color("Green Mana")
  let white = Color("White")
  let strawberryDreams = Color("Strawberry Dreams")
  let watermelonJuice = Color("Watermelon Juice")
  let red = Color("Red")
  
}

extension UIColor {
  
  static let latinCharm = UIColor(Color("Latin Charm"))
  
}
