//
//  CryptoMarket.swift
//  CryptoWallet
//
//  Created by Yevhenii on 09.05.2022.
//

import Foundation

struct CryptoMarket: Decodable {
  
  let trending: [Coin]
  let coins: [Coin]
}

struct Coin: Decodable, Identifiable {
  
  let id: String
  let symbol: String
  let name: String
  let price: String
  let percentage: Double
  let image: String
  
  var percentageString: String {
    String(format: "%.02f", percentage)
  }
}
