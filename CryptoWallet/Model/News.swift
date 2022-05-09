//
//  News.swift
//  CryptoWallet
//
//  Created by Yevhenii on 09.05.2022.
//

import Foundation

struct News: Decodable, Identifiable {
  
  let id: String
  let title: String
  let published: String
  let preview: String
  let image: String
}
