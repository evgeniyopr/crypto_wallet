//
//  CustomMultiLineButtonWithBorder.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct CustomMultiLineButtonWithBorder: View {
  
  let title: String
  let subtitle: String
  
  var body: some View {
    Button {
      print(title)
    } label: {
      VStack(spacing: 10) {
        Text(title)
          .font(.system(size: 16, weight: .semibold))
        Text(subtitle)
          .font(.system(size: 12, weight: .regular))
          
      }
      .foregroundColor(Color.theme.white)
      .frame(maxWidth: .infinity)
        .frame(height: 70)
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

struct CustomMultiLineButtonWithBorder_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CustomMultiLineButtonWithBorder(title: "Buy BTC", subtitle: "1 067 620 USD ≈ 5 BTC")
        .previewLayout(.sizeThatFits)
      CustomMultiLineButtonWithBorder(title: "Sell BTC", subtitle: "5 BTC ≈ 86 672.7 USD")
        .previewLayout(.sizeThatFits)
    }
  }
}
