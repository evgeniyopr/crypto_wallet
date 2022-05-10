//
//  OnboardingView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct OnboardingView: View {
  
  @EnvironmentObject private var viewModel: OnboardingViewModel
  
  var body: some View {
    GeometryReader(content: { geometry in
      ZStack{
        Rectangle()
          .fill(Color.theme.corbeau)
          .ignoresSafeArea()
        VStack {
          Spacer()
          Image(viewModel.currentStep.imageName)
            .id(#file)
            .transition(.opacity.animation(.easeOut))
          Spacer()
          bottomContainer
            .padding(20)
            .frame(height: geometry.size.height * 0.4)
            .id(#file)
            .transition(.opacity.animation(.easeOut))
        }
      }
    })
  }
  
  private var bottomContainer: some View {
    ZStack {
      Rectangle()
        .fill(Color.theme.latinCharm)
        .cornerRadius(30)
      VStack {
        Spacer()
        Text(viewModel.currentStep.title)
          .font(.system(size: 32, weight: .semibold))
          .foregroundColor(Color.theme.white)
        Spacer()
        Text(viewModel.currentStep.description)
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color.theme.heatherGrey)
          .multilineTextAlignment(.center)
        Spacer()
        Button {
          viewModel.didSelectContinue()
        } label: {
          Text(R.string.localizable.continue())
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(
              LinearGradient(gradient: Gradient(colors: [Color.theme.strawberryDreams,
                                                         Color.theme.watermelonJuice]),
                             startPoint: .leading, endPoint: .trailing))
            .cornerRadius(56/2)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.theme.white)
        }
        Spacer()
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static let viewModel = OnboardingViewModel(onboardingRepositoryService: OnboardingRepositoryService())
  
  static var previews: some View {
    OnboardingView()
      .environmentObject(viewModel)
      .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
      .previewDisplayName("iPhone 8")
    
    OnboardingView()
      .environmentObject(viewModel)
      .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
      .previewDisplayName("iPhone 12 Pro Max")
  }
}
