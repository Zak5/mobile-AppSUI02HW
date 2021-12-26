//
//  LazyView.swift
//  
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    let build: ()->Content
    public init(_ build: @autoclosure @escaping ()->Content) {
        self.build = build
    }
    
    public var body: some View {
        build()
    }
}
