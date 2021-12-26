//
//  ArticleView.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI
import Networking

struct ArticleView: View {
    
    var article: Article
    
    var body: some View {
        List {
            Text(article.title ?? "")
            Text(article.content ?? "")
            Button {
                //newsViewModel.loadNextPage()
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
