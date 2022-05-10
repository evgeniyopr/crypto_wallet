//
//  MarketView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct MarketView: View {
  
  @EnvironmentObject private var modelData: ModelData
  @State private var isPresented: Bool = false
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color.red)
        .ignoresSafeArea()
      List {
        ForEach(modelData.market.coins) { coin in
            MarketRow(coin: coin)
            .onTapGesture {
              isPresented = true
            }
        }
        .listRowBackground(Color.theme.corbeau)
        .listStyle(.inset)
      }
      .onAppear {
        UITableView.appearance().backgroundColor = .clear
      }
      .background(Color.theme.corbeau.edgesIgnoringSafeArea(.all))
      .fullScreenCover(isPresented: $isPresented) {
        CoinDetailView()
      }
    }
  }
}

struct MarketView_Previews: PreviewProvider {
  
  static var coins = ModelData().market.coins
  
  static var previews: some View {
    MarketView()
      .environmentObject(ModelData())
  }
}
