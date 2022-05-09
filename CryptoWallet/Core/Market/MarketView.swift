//
//  MarketView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct MarketView: View {
  
  @EnvironmentObject var modelData: ModelData
  @State var isPresented: Bool = false
  
  var body: some View {
      List {
        ForEach(modelData.market.coins) { coin in
            MarketRow(coin: coin)
            .onTapGesture {
              isPresented = true
            }
          
        }
        .listRowBackground(Color.theme.corbeau)
      }
      .listStyle(.plain)
      .background(Color.theme.corbeau.edgesIgnoringSafeArea(.all))
      .fullScreenCover(isPresented: $isPresented) {
        CoinDetailView()
          .animation(.easeInOut)
          .transition(.move(edge: .leading))
      }
  }
}

struct MarketView_Previews: PreviewProvider {
  
  static var coins = ModelData().market.coins
  
  static var previews: some View {
    MarketView()
      .background(Color.theme.corbeau)
      .environmentObject(ModelData())
  }
}
