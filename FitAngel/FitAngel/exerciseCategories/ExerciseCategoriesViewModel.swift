//
//  ExerciseCategoriesViewModel.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 09.02.2022.
//

import Foundation
import Combine

struct ExerciseCategoryCellModel: Identifiable {
    let imageName: String
    let name: String
    let id = UUID()
}

class ExerciseCategoriesViewModel: ObservableObject {
    
//    var groupName = [
//        ExerciseCategoryCellViewModel(imageName: "Руки", name: "Руки"),
//        ExerciseCategoryCellViewModel(imageName: "Плечи", name: "Плечи"),
//        ExerciseCategoryCellViewModel(imageName: "Спина", name: "Спина"),
//        ExerciseCategoryCellViewModel(imageName: "Грудь", name: "Грудь"),
//        ExerciseCategoryCellViewModel(imageName: "Пресс", name: "Пресс"),
//        ExerciseCategoryCellViewModel(imageName: "Ноги", name: "Ноги"),
//        ExerciseCategoryCellViewModel(imageName: "Кардио", name: "Кардио")
//    ]
    
    @Published var categories = [ExerciseCategoryCellModel]()
    
    private var publisher: AnyPublisher<[ExerciseCategoryCellModel], Never>
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        let provider = ExerciseCategoriesProvider()
        publisher = provider.readCategories()
        publisher
            .assign(to: \.categories, on: self)
            .store(in: &self.cancellableSet)
    }
    
    // Где выполнять чтение категорий из coredata
}

class ExerciseCategoriesProvider {
    private let coreDataManager = CoreDataManager()
    
    func readCategories() -> AnyPublisher<[ExerciseCategoryCellModel], Never> {
        return Just(coreDataManager.readCategories()
            .map({ExerciseCategoryCellModel(imageName: $0.imageName ?? "", name: $0.name ?? "" )}))
            .eraseToAnyPublisher()
    }
}
