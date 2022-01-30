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
            TrainingDiaryView()
                .preferredColorScheme(.dark)
        }
    }
}
