//
//  NavigationContainerViewModel.swift
//  
//
//  Created by Konstantin Zaharev on 26.12.2021.
//

import Foundation
import SwiftUI

public class NavigationContainerViewModel : ObservableObject {
    @Published var currentScreen: Screen?
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    public func push(screenView: AnyView) {
        self.navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    public func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
    
    public func popToRoot() {
        self.navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
