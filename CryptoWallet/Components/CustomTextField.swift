//
//  CustomTextField.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct CustomTextField: View {
  
  @State var text: String
  
  var body: some View {
    VStack {
      HStack {
        TextField("0", text: $text)
          .font(.system(size: 20, weight: .semibold))
          .foregroundColor(Color.theme.white)
          .placeholder(when: text.isEmpty) {
            Text("0")
              .font(.system(size: 20, weight: .semibold))
              .foregroundColor(Color.theme.heatherGrey)
          }
      }
      
      Rectangle()
        .frame(height: 1)
        .linearGradientForeground(colors: [Color.theme.strawberryDreams,
                                           Color.theme.watermelonJuice],
                                  startPoint: .leading,
                                  endPoint: .trailing)
      
      HStack {
        Text("Available: 0 BTC")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(Color.theme.heatherGrey)
        Spacer()
      }
    }
  }
}

struct CustomTextField_Previews: PreviewProvider {
  static var previews: some View {
    CustomTextField(text: "123")
  }
}
