//
//  NewsView.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import UIComponents
import Networking
import Navigation

struct NewsView: View {
    
    @StateObject var newsViewModel = NewsViewModel()

    var body: some View {
        VStack {
            CustomPickerView(categories: $newsViewModel.categories, selected: $newsViewModel.category) {
                Task {
                    await newsViewModel.getArticles()
                }
            }
            NewsArticlesListView(newsViewModel: newsViewModel)
        }
        .task {
            await newsViewModel.getArticles()
        }
    }
}

struct NewsArticlesListView: View {
    
    @ObservedObject var newsViewModel: NewsViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel

    var body: some View {
        List {
            ForEach(newsViewModel.articles) { article in
                NewsArticleCell(article: article).onTapGesture {
                    routeModel.push(screenView: LazyView(ArticleView(article: article)).toAnyView())
                }
            }
        }
        .listStyle(.plain)
    }
}

struct NewsArticleCell: View {
    
    var article: Article

    var body: some View {
        Text(article.title ?? "")
    }
    
}


struct NewsCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
