//
//  ModelData.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI

final class ModelData: ObservableObject {
  
  // MARK: - Public properties
  
//  var onboardingShownBefore: Bool
  
  @Published var profile: Profile = load("profile.json")
  @Published var market: CryptoMarket = load("market.json")
  @Published var news: [News] = load("news.json")
  
  // MARK: - Private properties
  
  
  
  
}

struct Profile: Decodable {
  
  let name: String
  let balance: String
  
}

struct CryptoMarket: Decodable {
  
  let trending: [String]
  let coins: [Coin]
  
}

struct Coin: Decodable, Identifiable {
  
  let id: String
  let symbol: String
  let name: String
  let price: String
  let percentage: String
  let image: String
}

struct News: Decodable, Identifiable {
  
  let id: String
  let title: String
  let published: String
  let preview: String
  let image: String
  
}


func load<T: Decodable>(_ filename: String) -> T {
  let data: Data
  
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
  else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
