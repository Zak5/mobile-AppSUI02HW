//
//  ArticleDetailView.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI
import Networking

struct ArticleDetailView: View {

    @Binding var article: Article
    
    var body: some View {
        List {
            Button {
                //newsViewModel.loadNextPage()
            } label: {
                Text("Read more")
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
