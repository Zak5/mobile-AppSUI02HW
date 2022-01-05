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
    @State var selectedArticle: Article?
    @State var selectedArticleId: String = ""
    @Namespace private var ns
    
    var body: some View {
        ZStack(alignment: .bottom){
            List {
                ForEach(newsViewModel.articles) { article in
                    NewsArticleCell(article: article)
                        .frame(maxHeight: 100)
                        .matchedGeometryEffect(id: article.id, in: ns, isSource: true)
                        .onTapGesture(count: 2) {
                            selectedArticle = article
                            selectedArticleId = article.id
                        }
                        .onTapGesture(count: 1) {
                            routeModel.push(screenView: LazyView(ArticleView(article: article)).toAnyView())
                        }
                }
            }
            .listStyle(.plain)
            
            if let article = selectedArticle {
                HStack {
                    Spacer()
                    NewsArticleCell(article: article)
                        .matchedGeometryEffect(id: selectedArticleId, in: ns, isSource: false)
                        .offset(x: 200, y: 100)
                        .frame(maxHeight: 100)
                        .scaleEffect(selectedArticleId == "" ? 0.5 : 1)
                        .frame(width: selectedArticleId == "" ? 300 : nil)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.0)) {
                                selectedArticleId = ""
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250)) {
                                selectedArticle = nil
                            }
                        }
                    
                }
            }
        }
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
