//
//  NewsViewModel.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import Networking

extension Article: Identifiable {
    public var id: String { url }
}

@MainActor
final class NewsViewModel : ObservableObject {
    
    @Published var category: String
    @Published var categories = [String]()
    @Published var articles = [Article]()
    
    init() {
        let newsCategories = InshortsNewsAPI.getCategories()
        categories = newsCategories
        category = newsCategories[0]
    }
    
    func getArticles() async {
        guard let articleList = await InshortsNewsAPI.getArticleList(category) else { return }
        self.articles = articleList.data
    }
}
