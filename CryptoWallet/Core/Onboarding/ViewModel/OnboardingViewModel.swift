//
//  OnboardingViewModel.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
  
  enum Step {
    case first, second, third
    
    var imageName: String {
      switch self {
      case .first:
        return "onboarding_illus_1"
      case .second:
        return "onboarding_illus_2"
      case .third:
        return "onboarding_illus_3"
      }
    }
    
    var title: String {
      switch self {
      case .first:
        return "Easiness"
      case .second:
        return "Security"
      case .third:
        return "Transormation"
      }
    }
    
    var description: String {
      switch self {
      case .first:
        return "Supplying the convenient \ntransactions chains"
      case .second:
        return "Providing crypto audience with \nhigh-tech security solutions"
      case .third:
        return "Diversifying crypto investment \nexperience worldwide"
      }
    }
  }
  
  // MARK: - Private properties
  private let onboardingRepositoryService: OnboardingRepositoryService
  @Published private(set) var currentStep: Step = .first
  
  // MARK: - Init
  
  init(onboardingRepositoryService: OnboardingRepositoryService) {
    self.onboardingRepositoryService = onboardingRepositoryService
  }
  
  // MARK: - Public methods
  
  func didSelectContinue() {
    switch currentStep {
    case .first:
      currentStep = .second
    case .second:
      currentStep = .third
    case .third:
      saveOnboardingShown()
    }
  }
  
  // MARK: - Private methods
  
  private func saveOnboardingShown() {
    onboardingRepositoryService.saveOnboardingShown()
  }
}
