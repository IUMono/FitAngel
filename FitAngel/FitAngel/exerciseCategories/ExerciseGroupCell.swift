//
//  ExerciseGroupCell.swift
//  FitAngel
//
//  Created by Света on 01.12.2021.
//

import SwiftUI

// ячейка для отображения картинки и названия категори упражнения
struct ExerciseGroupCell: View {
    var model: ExerciseCategory
    var body: some View {
        HStack {
            Image(model.imageName)
                .padding()
            Text(model.name)
                .foregroundColor(Color.white)
            Spacer()
        }
    }
}
