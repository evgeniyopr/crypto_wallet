//
//  ImageLoader.swift
//  CryptoWallet
//
//  Created by Yevhenii on 08.05.2022.
//

import UIKit
import Combine

final class ImageLoader {
  
  func downloadImage(with url: URL) -> AnyPublisher<UIImage?, Error> {
   URLSession.shared.dataTaskPublisher(for: url)
     .map(handleResponse)
     .mapError({ $0 })
     .eraseToAnyPublisher()
 }
  
  private func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
    guard
      let data = data,
      let image = UIImage(data: data),
      let response = response as? HTTPURLResponse,
      response.statusCode >= 200 && response.statusCode < 300 else {
      return nil
    }
    return image
  }
}
