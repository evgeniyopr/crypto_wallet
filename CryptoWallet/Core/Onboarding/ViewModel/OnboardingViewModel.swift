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
        return R.image.onboarding_illus_1.name
      case .second:
        return R.image.onboarding_illus_2.name
      case .third:
        return R.image.onboarding_illus_3.name
      }
    }
    
    var title: String {
      switch self {
      case .first:
        return R.string.localizable.easiness()
      case .second:
        return R.string.localizable.security()
      case .third:
        return R.string.localizable.transormation()
      }
    }
    
    var description: String {
      switch self {
      case .first:
        return R.string.localizable.subtitle_onboarding_1()
      case .second:
        return R.string.localizable.subtitle_onboarding_2()
      case .third:
        return R.string.localizable.subtitle_onboarding_3()
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
