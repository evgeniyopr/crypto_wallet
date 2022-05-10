//
//  TrendingViewCell.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct TrendingRow: View {
  
  var coin: Coin
  
  var body: some View {
    VStack {
      header
      image
      footer
    }
    .padding(16)
    .background(Color.theme.white.opacity(0.12))
    .cornerRadius(18)
  }
  
  private var header: some View {
    HStack(spacing: 0) {
      Image(coin.image)
        .scaledToFit()
        .frame(width: 64, height: 64)
      VStack(alignment: .leading) {
        Text(coin.name)
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color.theme.white)
        Spacer()
        Text(coin.symbol.uppercased())
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(Color.theme.white.opacity(0.6))
      }
      Spacer()
    }
    .frame(height: 36)
  }
  
  private var image: some View {
    Image(R.image.bitcoin_chart.name)
      .frame(width: 164, height: 37)
  }
  
  private var footer: some View {
    HStack {
      Text(coin.price)
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(Color.theme.white)
      Spacer()
      Image(R.image.arrow_drop.name)
      Text(coin.percentageString + "%")
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(Color.red)
    }
  }
}

struct TrendingRow_Previews: PreviewProvider {
  
  static var coins = ModelData().market.coins
  
  static var previews: some View {
    Group {
      TrendingRow(coin: coins[0])
      TrendingRow(coin: coins[1])
    }
    .previewLayout(.fixed(width: 195 + 16, height: 155 + 16))
    .background(Color.theme.corbeau)
  }
}
