//
//  TrainingDiaryViewModel.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 03.02.2022.
//

import Foundation

class TrainingDiaryViewModel: ObservableObject {
    // input
//    @Published var date = Date()
    
    @Published var titleCellModels: [TrainingDiaryTitleCellModel] = [
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: false),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: false),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: false),
        TrainingDiaryTitleCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true)]
    
    
}
