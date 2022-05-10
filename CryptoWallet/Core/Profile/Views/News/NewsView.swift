//
//  NewsView.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct NewsView: View {
  
  let news: [News]
  
  var body: some View {
    VStack {
      header
      list
    }
  }
  
  private var header: some View {
    HStack {
      Image(R.image.news_coin.name)
      Text(R.string.localizable.news())
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(Color.theme.white)
      Spacer()
      Button {
        print(#function)
      } label: {
        Text(R.string.localizable.show_all())
          .font(.system(size: 16, weight: .semibold))
          .linearGradientForeground(colors: [Color.theme.strawberryDreams,
                                             Color.theme.watermelonJuice],
                                    startPoint: .leading,
                                    endPoint: .trailing)
      }
    }
    .padding(.leading, 20)
    .padding(.trailing, 20)
    .padding(.top, 43)
    .padding(.bottom, 26)
  }
  
  private var list: some View {
    List {
      ForEach(news) { item in
        NewsRow(news: item)
      }
      .listRowBackground(Color.theme.corbeau)
    }
    .listStyle(.plain)
  }
}

struct NewsView_Previews: PreviewProvider {
  
  static var news = ModelData().news
  
  static var previews: some View {
    NewsView(news: news)
      .previewLayout(.sizeThatFits)
      .background(Color.theme.corbeau)
  }
}

extension View {
  public func linearGradientForeground(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
    self.overlay(
      LinearGradient(
        colors: colors,
        startPoint: startPoint,
        endPoint: endPoint)
    )
    .mask(self)
  }
  
  public func radianGradientForeground(colors: [Color], center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) -> some View {
    self.overlay(
      RadialGradient(colors: colors,
                     center: center,
                     startRadius: startRadius,
                     endRadius: endRadius)
    )
    .mask(self)
  }
}
