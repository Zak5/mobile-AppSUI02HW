//
//  ArticleDetailView.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI
import Networking
import Navigation

struct ArticleDetailView: View {

    var article: Article
    @EnvironmentObject var routeModel: NavigationContainerViewModel

    var body: some View {
        List {
            Button {
                routeModel.popToRoot()
            } label: {
                Text("Back to news")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
            }
            Text("Author: \(article.author ?? "")")
            Text("Date: \(article.date ?? "")")
            Text("time: \(article.time ?? "")")
            Text("Source: \(article.url)")
        }
        .listStyle(.plain)
    }
}
