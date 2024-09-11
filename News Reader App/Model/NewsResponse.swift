//
//  NewsResponse.swift
//  News Reader App
//
//  Created by Viraj1968883 on 10/09/24.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}
