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
        return "Easiness"
      case .third:
        return "Easiness"
      }
    }
    
    var description: String {
      switch self {
      case .first:
        return "Supplying the convenient \n transactions chains"
      case .second:
        return "Supplying the convenient \n transactions chains"
      case .third:
        return "Supplying the convenient \n transactions chains"
      }
    }
  }
  
  @Published private(set) var currentStep: Step = .first
  
  func didSelectContinue() {
    switch currentStep {
    case .first:
      currentStep = .second
    case .second:
      currentStep = .third
    case .third:
      currentStep = .first
    }
  }
}
