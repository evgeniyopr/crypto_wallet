//
//  OnboardingRepositoryService.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import Foundation

final class OnboardingRepositoryService: ObservableObject {
  
  // MARK: - Constants
  
  struct Constants {
    
    static let onboardingShownBeforeKey = "onboardingShownBefore"
    
  }
  
  // MARK: - Public properties
  
  @Published private(set) var onboardingShownBefore: Bool
  
  // MARK: - Init
  
  init () {
    onboardingShownBefore = UserDefaults.standard.bool(forKey: Constants.onboardingShownBeforeKey)
  }
  
  // MARK: - Public methods
  
  func saveOnboardingShown() {
    UserDefaults.standard.set(true, forKey: Constants.onboardingShownBeforeKey)
    onboardingShownBefore = true
  }
  
}
