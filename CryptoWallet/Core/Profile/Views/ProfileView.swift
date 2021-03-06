//
//  ProfileView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct ProfileView: View {
  
  @EnvironmentObject private var modelData: ModelData
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ProfileHeaderView()
        TrendingView(coins: modelData.market.trending)
        NewsView(news: modelData.news)
          .frame(height: 300)
      }
    }
    .padding(.top, 30)
    .background(Color.theme.corbeau)
    .ignoresSafeArea(.container, edges: .top)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .background(Color.theme.corbeau)
      .environmentObject(ModelData())
  }
}
