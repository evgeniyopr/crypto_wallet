//
//  TrandingView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct TrendingView: View {
  
  var coins: [Coin]
  
  var body: some View {
    VStack {
      header
      collection
    }
  }
  
  private var header: some View {
    HStack {
      Image("fire")
      Text("Trending")
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(Color.theme.white)
      Spacer()
    }
    .padding(.leading, 16)
  }
  
  private var collection: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(coins) { coin in
          TrendingRow(coin: coin)
        }
      }
    }
  }
}

struct TrandingView_Previews: PreviewProvider {
  
  static var coins = ProfileViewModel().market.coins
  
  static var previews: some View {
    TrendingView(coins: coins)
      .previewLayout(.sizeThatFits)
      .background(Color.theme.corbeau)
  }
}
