//
//  ContentView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct ContentView: View {
  
  @State private var selection: Tab = .profile
  
  enum Tab {
    case profile
    case market
  }
  
  init() {
    UITabBar.appearance().barTintColor = UIColor.latinCharm
  }
  
  var body: some View {
    TabView(selection: $selection) {
      ProfileView()
        .tabItem {
          Image(selection == .profile ? R.image.profile_tab_selected.name : R.image.profile_tab_unselected.name)
        }
        .tag(Tab.profile)
      MarketView()
        .tabItem {
          Image(selection == .market ? R.image.market_tab_selected.name :  R.image.market_tab_unselected.name)
        }
        .tag(Tab.market)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
