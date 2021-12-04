//
//  TrainingDiaryView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 19.11.2021.
//

import Combine
import SwiftUI

// MARK: - Dynamic List Example

struct SlowDataStore {
    // TODO: отредактировать
    static func getAmount(forIndex _: Int) -> AnyPublisher<Date, Never> {
        Just(Date())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map { val in usleep(UInt32.random(in: 500_000 ..< 2_000_000)); return val }
            .eraseToAnyPublisher()
    }
}

final class HorizontalCalendarItem: ListDataItem, ObservableObject {
    
    @Published var date: Date?
    
    var dayOfWeek: String {
        return "пн"
    }
    
    var dayOfMonth: String {
        return "11"
    }
    
    var index: Int = 0
    
    var dataIsFetched: Bool {
        date != nil
    }
    
    private var dataPublisher: AnyCancellable?
    
    init(index: Int) {
        self.index = index
    }
    
    func fetchData() {
        if !dataIsFetched {
            dataPublisher = SlowDataStore.getAmount(forIndex: index)
                .receive(on: DispatchQueue.main)
                .sink { date in
                    self.date = date
            }
        }
    }
}



/// Экран тренировок
struct TrainingDiaryView: View {
    
    var listProvider = ListDataProvider<HorizontalCalendarItem>(itemBatchCount: 20, prefetchMargin: 3)
    @State private var isPresented = false
    
    var body: some View {
//        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                VStack {
                    DynamicCollectionView<HorizontalCalendarCell>(listProvider: listProvider)
                    
                    Button("Present!") {
                                isPresented.toggle()
                            }
                            .fullScreenCover(isPresented: $isPresented, content: ExerciseCategoriesView.init)
                    
//                    Button {
//                        self.listProvider.reset()
//                    } label: {
//                        Spacer()
//                        Text("Добавить упражнения")
//                        NavigationLink("Добавить упражнения", destination: ExerciseCategoriesView())
//                        Spacer()
//                    }
//                    .fullScreenCover(isPresented: true, content: ExerciseCategoriesView())
                    .background(Color.yellow)
                    .padding()
                    
                }
            }
//        }
    }
}

struct TrainingDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDiaryView()
            .background(Color.gray)
    }
}
