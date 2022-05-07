//
//  OnboardingView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct OnboardingView: View {
  
  @StateObject private var viewModel = OnboardingViewModel()
  
  var body: some View {
    ZStack{
      Rectangle()
        .fill(Color.theme.corbeau)
        .ignoresSafeArea()
      VStack {
        Spacer()
        Image(viewModel.currentStep.imageName)
        Spacer()
        bottomContainer
          .padding(20)
          .frame(height: 300)
      }
    }
  }
  
  private var bottomContainer: some View {
    ZStack {
      Rectangle()
        .fill(Color.theme.latinCharm)
        .cornerRadius(30)
      VStack {
        Text(viewModel.currentStep.title )
          .font(.custom("SF Pro Display", size: 32))
          .foregroundColor(Color.theme.white)
        Text(viewModel.currentStep.description)
          .font(.custom("SF Pro Display", size: 16))
          .foregroundColor(Color.theme.heatherGrey)
          .multilineTextAlignment(.center)
          .padding(.top, 16)
          .padding(.bottom, 24)
        Button("Continue") {
          viewModel.didSelectContinue()
        }
        .frame(height: 56)
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .cornerRadius(56/2)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .font(.custom("SF Pro Display", size: 16))
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
