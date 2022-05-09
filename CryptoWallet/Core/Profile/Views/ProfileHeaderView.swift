//
//  ProfileHeaderView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
  
  @EnvironmentObject private var modelData: ModelData
  
  var body: some View {
    VStack{
      header
      balance
      buttons
    }
  }
  
  private var header: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Welcome back,")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color.theme.heatherGrey)
        Text(modelData.profile.name + " 👋")
          .font(.system(size: 24, weight: .semibold))
          .foregroundColor(Color.theme.white)
      }
      Spacer()
      modelData.avatar
        .resizable()
        .frame(width: 60, height: 60)
        .cornerRadius(30)
    }
    .padding(16)
  }
  
  private var balance: some View {
    ZStack {
      Circle()
        .fill(Color.theme.latinCharm).opacity(0.5)
        .frame(width: 180, height: 180)
      Circle()
        .fill(Color.theme.latinCharm).opacity(0.5)
        .frame(width: 180, height: 180)
        .radianGradientForeground(colors: [Color.theme.strawberryDreams, .clear],
                                  center: .center,
                                  startRadius: 0,
                                  endRadius: 100)
      Text(modelData.profile.balance)
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(.white)
    }
  }
  
  private var buttons: some View {
    HStack(spacing: 10) {
      CustomButtonWithBorder(title: "Deposit")
      CustomButtonWithBorder(title: "Withdraw")
    }
    .padding(.top, 32)
    .padding(.trailing, 20)
    .padding(.leading, 20)
    .padding(.bottom, 47)
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView()
      .environmentObject(ModelData())
      .previewLayout(.sizeThatFits)
      .background(Color.theme.corbeau)
  }
}
