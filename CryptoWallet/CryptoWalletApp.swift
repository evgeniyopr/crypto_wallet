//
//  CryptoWalletApp.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

@main
struct CryptoWalletApp: App {
  
  @StateObject var viewModel = ProfileViewModel()
  
  var body: some Scene {
    WindowGroup {
      ProfileView()
        .environmentObject(viewModel)
    }
  }
}
