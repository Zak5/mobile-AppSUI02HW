//
//  ArticleView.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI
import Networking
import Navigation

struct ArticleView: View {
    
    var article: Article
    @EnvironmentObject var routeModel: NavigationContainerViewModel

    var body: some View {
        List {
            Text(article.title ?? "")
            Text(article.content ?? "")
            Button {
                routeModel.push(screenView: LazyView(ArticleDetailView(article: article)).toAnyView())
            } label: {
                Text("Read more")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
            }
        }
        .listStyle(.plain)
    }
}
