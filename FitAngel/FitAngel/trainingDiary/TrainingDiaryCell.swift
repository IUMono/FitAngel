//
//  TrainingDiaryCell.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 07.12.2021.
//

import Foundation
import SwiftUI

struct TrainingDiaryCellModel: Identifiable {
    let id: UUID
    let icon: String
    let title: String
    let subtitle: String
}

/// Ячейка с упражнением тренировки
struct TrainingDiaryCell: View {
    
    var model: TrainingDiaryCellModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(model.icon)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
            VStack {
                Text(model.title)
                    .foregroundColor(Color(red: 0.529, green: 0.557, blue: 0.62))
                    .font(.system(size: 16))
                Text(model.subtitle)
                    .foregroundColor(Color(red: 0.529, green: 0.557, blue: 0.62))
                    .font(.system(size: 14))
            }
        }
    }
}

struct TrainingDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDiaryCell(model: TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя")).background(Color.darkGrey)
    }
}
