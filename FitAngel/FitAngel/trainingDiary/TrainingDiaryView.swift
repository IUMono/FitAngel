//
//  TrainingDiaryView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 19.11.2021.
//

import Combine
import SwiftUI

/// Экран тренировок
struct TrainingDiaryView: View {
    
    var listProvider = ListDataProvider<HorizontalCalendarItemModel>(itemBatchCount: 20, prefetchMargin: 3)
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkGrey.ignoresSafeArea()
                VStack {
                    DynamicCollectionView<HorizontalCalendarCell>(listProvider: listProvider)
                    
                    Button {
//                        self.listProvider.reset()
                    } label: {
                        Spacer()
                        NavigationLink("Добавить упражнения", destination: ExerciseCategoriesView())
                            .padding()
                        Spacer()
                    }
                    .foregroundColor(Color.black)
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .padding()
                }
            }
        }
    }
}

struct TrainingDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDiaryView()
    }
}
