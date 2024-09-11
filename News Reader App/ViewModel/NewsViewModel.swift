//
//  NewsViewModel.swift
//  News Reader App
//
//  Created by Viraj1968883 on 10/09/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles = [NewsArticle]()
    @Published var bookmarkedArticles = [NewsArticle]()
    @Published var category = "business" {
        didSet {
            fetchNews()
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        NetworkManager.shared.fetchNews(for: category)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching news: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &cancellables)
    }
    
    func toggleBookmark(for article: NewsArticle) {
        if let index = bookmarkedArticles.firstIndex(where: { $0.id == article.id }) {
            bookmarkedArticles.remove(at: index)
        } else {
            bookmarkedArticles.append(article)
        }
    }
    
    func isBookmarked(_ article: NewsArticle) -> Bool {
        bookmarkedArticles.contains(where: { $0.id == article.id })
    }
}
