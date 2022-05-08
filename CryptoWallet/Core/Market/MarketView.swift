//
//  MarketView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct MarketView: View {
  
  var coins: [Coin]
  
  var body: some View {
    List {
      ForEach(coins) { coin in
        MarketRow(coin: coin)
      }
      .listRowBackground(Color.theme.corbeau)
    }
    .listStyle(.plain)
  }
}

struct MarketView_Previews: PreviewProvider {
  
  static var coins = ProfileViewModel().market.coins
  
  static var previews: some View {
    MarketView(coins: coins)
      .background(Color.theme.corbeau)
  }
}
