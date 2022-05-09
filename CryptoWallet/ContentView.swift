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
          Image(selection == .profile ? "profile_tab_selected" : "profile_tab_unselected")
        }
        .tag(Tab.profile)
      MarketView()
        .tabItem {
          Image(selection == .market ? "market_tab_selected" : "market_tab_unselected")
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
