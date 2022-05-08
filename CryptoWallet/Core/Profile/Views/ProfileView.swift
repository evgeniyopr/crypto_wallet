//
//  ProfileView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct ProfileView: View {
  
  @EnvironmentObject var viewModel: ProfileViewModel
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ProfileHeaderView()
        TrendingView(coins: viewModel.market.coins)
        NewsView(news: viewModel.news)
          .frame(height: 260)
      }
    }
    .padding(.top, 30)
    .background(Color.theme.corbeau)
    .ignoresSafeArea()
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .environmentObject(ProfileViewModel())
  }
}
