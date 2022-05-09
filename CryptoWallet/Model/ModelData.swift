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
    if let image = fetchAvatarFromStore() {
      self.avatar = Image(uiImage: image)
    } else {
    imageLoader.downloadImage(with: url)
      .receive(on: DispatchQueue.main)
      .sink { _ in
        
      } receiveValue: { [weak self] image in
        guard let self = self,
              let image = image else { return }
        
        self.avatar = Image(uiImage: image)
        self.saveImage(image: image)
      }
      .store(in: &cancellables)
    }
  }
  
  private func saveImage(image: UIImage) {
    UserDefaults.standard.set(image.jpegData(compressionQuality: 100), forKey: "avatar")
  }
  
  private func fetchAvatarFromStore() -> UIImage? {
    if let imageData = UserDefaults.standard.value(forKey: "avatar") as? Data {
      return UIImage(data: imageData)
    }
    return nil
  }
}
