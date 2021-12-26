//
//  Transition.swift
//  
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import SwiftUI

public enum Transition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case pop
    case push
    case popToRoot
}

