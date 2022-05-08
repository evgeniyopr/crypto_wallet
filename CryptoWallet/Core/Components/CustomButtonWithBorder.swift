//
//  CustomButtonWithBorder.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct CustomButtonWithBorder: View {
  
  let title: String
  
  var body: some View {
    Button {
      print(title)
    } label: {
      Text(title)
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(Color.theme.white)
        .frame(maxWidth: .infinity)
        .frame(height: 48)
    }
    .background(Color.theme.latinCharm)
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(
          LinearGradient(colors: [Color.theme.watermelonJuice,
                                  Color.theme.strawberryDreams],
                         startPoint: .trailing,
                         endPoint: .leading),
          lineWidth: 1)
    )
  }
}

struct CustomButtonWithBorder_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CustomButtonWithBorder(title: "Deposit")
        .previewLayout(.sizeThatFits)
      CustomButtonWithBorder(title: "Withdraw")
        .previewLayout(.sizeThatFits)
    }
  }
}
