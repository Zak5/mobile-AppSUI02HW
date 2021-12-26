//
//  ArticleList.swift
//  
//
//  Created by Konstantin Zaharev on 23.12.2021.
//

import Foundation

public struct ArticleList: Codable, Hashable {
    
    public var category: String
    public var success: Bool
    public var data: [Article]
    
}
