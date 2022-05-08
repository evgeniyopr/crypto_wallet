//
//  CryptoWalletApp.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

@main
struct CryptoWalletApp: App {
  
  @StateObject var onboardingRepositoryService = OnboardingRepositoryService()
  
  @StateObject var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      if onboardingRepositoryService.onboardingShownBefore {
        ContentView()
          .environmentObject(modelData)
      } else {
        OnboardingView()
          .environmentObject(OnboardingViewModel(onboardingRepositoryService: onboardingRepositoryService))
      }
    }
  }
}
