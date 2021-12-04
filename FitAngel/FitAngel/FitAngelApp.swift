//
//  FitAngelApp.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 19.11.2021.
//

import SwiftUI

@main
struct FitAngelApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ExerciseCategoriesView()
                    .background(Color(red: 0.157, green: 0.173, blue: 0.22, opacity: 1), ignoresSafeAreaEdges: .all)
            } else {
                ExerciseCategoriesView()
                    .background(Color(red: 0.157, green: 0.173, blue: 0.22, opacity: 1))
            }

        }
    }
}
