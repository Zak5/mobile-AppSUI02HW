//
//  SwiftUIView.swift
//  
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI

extension View {
    public func toAnyView()->AnyView {
        AnyView(self)
    }
}
