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
      Image(R.image.fire.name)
      Text(R.string.localizable.trending())
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(Color.theme.white)
      Spacer()
    }
    .padding(.leading, 16)
  }
  
  private var collection: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 17) {
        ForEach(coins) { coin in
          TrendingRow(coin: coin)
        }
      }
      .padding(.leading, 20)
      .padding(.trailing, 20)
    }
  }
}

struct TrendingView_Previews: PreviewProvider {
  
  static var coins = ModelData().market.coins
  
  static var previews: some View {
    TrendingView(coins: coins)
      .previewLayout(.sizeThatFits)
      .background(Color.theme.corbeau)
  }
}
