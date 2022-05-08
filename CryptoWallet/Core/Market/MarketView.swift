//
//  MarketView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct MarketView: View {
  
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
//    VStack {
    List {
      ForEach(modelData.market.coins) { coin in
        MarketRow(coin: coin)
      }
      .listRowBackground(Color.theme.corbeau)
    }
    
    .listStyle(.plain)
//    .background(Color.theme.corbeau)
    .background(Color.theme.corbeau.edgesIgnoringSafeArea(.all))
//    .ignoresSafeArea(., edges: <#T##Edge.Set#>)
    }
//    .ignoresSafeArea()
//    .background(Color.theme.corbeau)
//  }
    
}

struct MarketView_Previews: PreviewProvider {
  
  static var coins = ModelData().market.coins
  
  static var previews: some View {
    MarketView()
      .background(Color.theme.corbeau)
      .environmentObject(ModelData())
  }
}
