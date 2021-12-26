//
//  AppSUI02HWApp.swift
//  AppSUI02HW
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import Navigation

@main
struct AppSUI02HWApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(transition: Transition.custom(.slide), content: {
                NewsView()
            })
        }
    }
}
