//
//  ModelData.swift
//  CryptoWallet
//
//  Created by Yevhenii on 07.05.2022.
//

import SwiftUI
import Combine

final class ModelData: ObservableObject {
  
  // MARK: - Private properties
  
  private let url = URL(string: "https://thispersondoesnotexist.com/image")! // mock url
  private let imageLoader = ImageLoader()
  private var cancellables = Set<AnyCancellable>()
  
  // MARK: - Public properties
  
  @Published var profile: Profile = FileLoader.load("profile.json")
  @Published var market: CryptoMarket = FileLoader.load("market.json")
  @Published var news: [News] = FileLoader.load("news.json")
  @Published var avatar: Image = Image("placeholder")
  
  init() {
    fetchAvatar()
  }
  
  // MARK: - Private methods
  
  private func fetchAvatar() {
    imageLoader.downloadImage(with: url)
      .receive(on: DispatchQueue.main)
      .sink { _ in
        
      } receiveValue: { [weak self] image in
        guard let self = self,
              let image = image else { return }
        
        self.avatar = Image(uiImage: image)
      }
      .store(in: &cancellables)
  }
  
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
