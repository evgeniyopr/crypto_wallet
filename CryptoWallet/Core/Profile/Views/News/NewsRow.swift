//
//  NewsRow.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

struct NewsRow: View {
  
  let news: News
  
    var body: some View {
      HStack(spacing: 23) {
        Image(news.image)
          .frame(width: 80, height: 80)
          .cornerRadius(6)
        
        VStack(alignment: .leading) {
          HStack {
            Text(news.title)
            Circle()
              .frame(width: 5, height: 5)
            Text(news.published)
          }
          .padding(.bottom, 10)
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(Color.theme.heatherGrey)
          Text(news.preview)
            .lineLimit(3)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color.theme.white)
          Spacer()
        }
      }
      .frame(height: 80)
    }
}

struct NewsRow_Previews: PreviewProvider {
  
  static var news = ProfileViewModel().news
  
    static var previews: some View {
      Group {
        NewsRow(news: news[0])
//        NewsRow(news: news[1])
      }
        .previewLayout(.fixed(width: 300, height: 80))
        .background(Color.theme.corbeau)
    }
}
