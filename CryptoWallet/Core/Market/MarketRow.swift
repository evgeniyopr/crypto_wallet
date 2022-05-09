//
//  MarketRow.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct MarketRow: View {
  
  var coin: Coin
  
    var body: some View {
      HStack {
        Image(coin.image)
        VStack(alignment: .leading) {
          Text(coin.name)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.theme.white)
          Spacer()
          Text(coin.symbol)
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(Color.theme.heatherGrey)
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text(coin.price)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(Color.theme.heatherGrey)
          Spacer()
          Text(coin.percentageString + "%")
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(coin.percentage > 0 ? Color.theme.greenMana : Color.theme.red)
        }
      }
      .frame(height: 46)
      .padding(.top, 20)
      .padding(.bottom, 20)
    }
}

struct MarketRow_Previews: PreviewProvider {
  
  static var coins = ModelData().market.coins
  
    static var previews: some View {
      Group {
        MarketRow(coin: coins[1])
        MarketRow(coin: coins[2])
      }
      .previewLayout(.sizeThatFits)
      .background(Color.theme.corbeau)
    }
}
