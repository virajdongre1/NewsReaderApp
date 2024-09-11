//
//  NewsService.swift
//  News Reader App
//
//  Created by Viraj1968883 on 10/09/24.
//

import Foundation
import Combine

struct Config {
    static let apiKey = "72ed05667a994301a80f02d498f3b4bb"
    static let baseUrl = "https://newsapi.org/v2/top-headlines"
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchNews(for category: String) -> AnyPublisher<[NewsArticle], NetworkError> {
        guard let url = URL(string: "\(Config.baseUrl)?country=us&category=\(category)&apiKey=\(Config.apiKey)") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .mapError { _ in NetworkError.decodingError }
            .eraseToAnyPublisher()
    }
}
