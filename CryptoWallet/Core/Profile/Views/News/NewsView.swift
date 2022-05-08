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
      Image("news_coin")
      Text("News")
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(Color.theme.white)
      Spacer()
      Button("Show all") {
        print(#function)
      }
    }
    .padding(20)
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
  
  static var news = ProfileViewModel().news
  
  static var previews: some View {
    NewsView(news: news)
      .previewLayout(.sizeThatFits)
      .background(Color.theme.corbeau)
  }
}
