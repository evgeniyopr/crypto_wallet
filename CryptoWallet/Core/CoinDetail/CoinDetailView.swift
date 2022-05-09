//
//  CoinDetailView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import SwiftUI

struct CoinDetailView: View {
  
  @Environment(\.presentationMode) private var presentationMode
  @State private var firstCoin: String = ""
  @State private var secondCoin: String = ""
  @State private var isShowMore: Bool = false
  
  var paragraphStyle: NSParagraphStyle {
    let style = NSMutableParagraphStyle()
    style.alignment = .justified
    return style
  }
  
  var body: some View {
    VStack(spacing: 0) {
      header
      ScrollView(showsIndicators: false) {
        CustomTextField(text: firstCoin)
          .padding()
        CustomTextField(text: secondCoin)
          .padding()
        HStack(spacing: 10) {
          CustomMultiLineButtonWithBorder(title: "Buy BTC",
                                          subtitle: "1 067 620 USD ≈ 5 BTC")
          CustomMultiLineButtonWithBorder(title: "Sell BTC",
                                          subtitle: "5 BTC ≈ 86 672.7 USD")
        }
        .padding()
        about
          .padding()
        footer
          .padding()
      }
    }
    .ignoresSafeArea(.container)
    .background(Color.theme.corbeau.ignoresSafeArea())
  }
  
  private var header: some View {
    VStack {
      ZStack {
        Text("BTC/USD")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color.theme.white)
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image("back")
            
          }
          Spacer()
        }
        .padding()
      }
      Text("$ 49 298.69")
        .font(.system(size: 32, weight: .semibold))
        .foregroundColor(Color.theme.white)
      Text("-0.27%")
        .font(.system(size: 16, weight: .regular))
        .foregroundColor(Color.theme.red)
        .padding(.top, 5)
      HStack {
        VStack(spacing: 7) {
          Text("24h Low")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(Color.theme.heatherGrey)
          Text("$ 45 848")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.theme.white)
        }
        Spacer()
        VStack(spacing: 7) {
          Text("24h High")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(Color.theme.heatherGrey)
          Text("$ 49300")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.theme.white)
        }
        Spacer()
        VStack(spacing: 7) {
          Text("Volume (BTC)")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(Color.theme.heatherGrey)
          Text("0.0387")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.theme.white)
        }
      }
      .padding(.top, 25)
      .padding(.bottom, 38)
      .padding(.trailing, 20)
      .padding(.leading, 20)
    }
    .padding(.top, 25)
    .frame(maxWidth: .infinity)
    .background(Color.theme.latinCharm)
    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
  }
  
  private var about: some View {
    VStack {
      HStack {
        Image("money")
        Text("About")
          .font(.system(size: 20, weight: .semibold))
          .foregroundColor(Color.theme.white)
        Spacer()
      }
      Text("From humble beginnings in 2008 to its 2021 price peak, Bitcoin (BTC) has taken investors and the world for quite the ride. In just over a decade, the first cryptocurrency has spiked and crashed and rallied and fallen again, over and over, on the way to a price in the tens of thousands. \nBitcoin is a decentralized peer-to-peer electronic exchange. Breaking it down, this means people can send money directly to one another without a bank or third party as an intermediary. Bitcoin was created so people don't have to rely on government or financial institutions to make financial transactions. Bitcoin allows users to transact amongst themselves using the Bitcoin blockchain, which relies on a proof-of-work method for tracking and verification of transactions.\nToday, Bitcoin is the world's most popular cryptocurrency, and some advocates believe that it could one day replace physical cash. While Bitcoin is not perfect, investors are optimistic about the developments that have been made since the crypto's inception. Bitcoin growth has rallied a fervent community that is excited about cryptocurrency's rise and the opportunities it will present for investors and businesses.")
        .lineLimit(isShowMore ? .max : 6)
        .font(.system(size: 14, weight: .regular))
        .if(isShowMore) { view in
          view.foregroundColor(Color.theme.white)
        }
        .if(!isShowMore) { view in
          view.linearGradientForeground(colors: [Color.theme.white, Color.theme.white.opacity(0.01)],
                                        startPoint: .top,
                                        endPoint: .bottom)
        }
      if !isShowMore {
        Button(action: {
          isShowMore = true
        }, label: {
          Text("Show More +")
            .font(.system(size: 16, weight: .semibold))
            .linearGradientForeground(colors: [Color.theme.strawberryDreams,
                                               Color.theme.watermelonJuice],
                                      startPoint: .leading,
                                      endPoint: .trailing)
        })
      }
    }
  }
  
  var grad: some View {
    EmptyView()
      .linearGradientForeground(colors: [Color.theme.white, Color.theme.white.opacity(0.01)],
                                startPoint: .top,
                                endPoint: .bottom)
  }
  
  private var footer: some View {
    VStack(spacing: 12) {
      HStack {
        Text("Rank")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color.theme.white)
        Spacer()
        Text("№1")
          .font(.system(size: 16, weight: .regular))
          .foregroundColor(Color.theme.heatherGrey)
      }
      .padding()
      .background(Color.theme.latinCharm)
      .cornerRadius(12)
      HStack {
        Text("Launch Date")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(Color.theme.white)
        Spacer()
        Text("January 3, 2009")
          .font(.system(size: 16, weight: .regular))
          .foregroundColor(Color.theme.heatherGrey)
      }
      .padding()
      .background(Color.theme.latinCharm)
      .cornerRadius(12)
    }
  }
}

struct CoinDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CoinDetailView()
      .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
      .previewDisplayName("iPhone 8")
    
    CoinDetailView()
      .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
      .previewDisplayName("iPhone 12 Pro Max")
  }
}
