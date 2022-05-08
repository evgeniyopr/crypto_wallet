//
//  ProfileHeaderView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
  
  @EnvironmentObject var viewModel: ModelData

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
        Text(viewModel.profile.name + "👋")
          .font(.system(size: 24, weight: .semibold))
          .foregroundColor(Color.theme.white)
      }
      Spacer()
      //      Image("close")
      Rectangle()
        .fill(.red)
        .frame(width: 60, height: 60)
    }
    .padding(16)
  }
  
  private var balance: some View {
    ZStack {
      Circle()
        .fill(.red)
        .frame(width: 180, height: 180)
      Text(viewModel.profile.balance)
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(.white)
    }
  }
  
  private var buttons: some View {
    HStack {
      Button("424") {
        print("")
      }
      Button("424") {
        print("")
      }
    }
    .padding()
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
