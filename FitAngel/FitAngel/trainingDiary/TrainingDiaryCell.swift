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
    let needAddButton: Bool
}

/// Ячейка с упражнением тренировки
struct TrainingDiaryCell: View {
    
    var model: TrainingDiaryCellModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(model.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .padding([.leading, .bottom, .trailing])
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .foregroundColor(.greyColor)
                    .font(.system(size: 16))
                Text(model.subtitle)
                    .foregroundColor(.greyColor)
                    .font(.system(size: 14))
                
                if model.needAddButton {
                    Button {
                        
                    } label: {
                        Text("Добавить")
                            .padding()
                    }
                    .foregroundColor(.gray)
                    .background(Color.blackLight)
                    .cornerRadius(20)
                }
            }
            Spacer()
        }
    }
}

struct TrainingDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        let model = TrainingDiaryCellModel(
            id: UUID(),
            icon: "Руки",
            title: "Подъем гантелей",
            subtitle: "К подбородку стоя",
            needAddButton: true)
        
        TrainingDiaryCell(model: model)
            .background(Color.blackDark)
    }
}
