//
//  Article.swift
//  
//
//  Created by Konstantin Zaharev on 23.12.2021.
//

import Foundation

public struct Article: Codable, Hashable {

    public var author: String?
    public var content: String?
    public var date: String?
    public var imageUrl: String?
    public var readMoreUrl: String?
    public var time: String?
    public var title: String?
    public var url: String
    
}
