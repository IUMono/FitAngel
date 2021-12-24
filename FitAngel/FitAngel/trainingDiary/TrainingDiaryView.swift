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
    
    // моки
//    var viewModels: [TrainingDiaryCellModel] = []
    var viewModels: [TrainingDiaryCellModel] = [TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: false), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: false), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: false), TrainingDiaryCellModel(id: UUID(), icon: "Руки", title: "Подъем гантелей", subtitle: "К подбородку стоя", needAddButton: true)]
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blackDark.ignoresSafeArea()
                VStack {
                    DynamicCollectionView<HorizontalCalendarCell>(listProvider: listProvider)
                    
                    if viewModels.isEmpty {
                        
                        Spacer()
                        
                        HStack {
                            Text("Составьте план тренировки")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 24))
                                .padding()
                            Spacer()
                        }
                        
                        HStack {
                            Text("Выберите упражнения из списка или создайте свои")
                                .lineLimit(0)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                        Image("Arrow")
                    } else {
                        ScrollView {
                            ForEach(viewModels) {
                                TrainingDiaryCell(model: $0)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
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
            .navigationTitle("Сегодня") // TODO: должна отображаться дата, выбранная в календаре
            .toolbar {
                Button {
                    
                } label: {
                    
                    NavigationLink("Settings", destination: SettingsViewControllerRepresentable())
                }

            }
        }
    }
}

struct TrainingDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDiaryView()
            .preferredColorScheme(.dark)
    }
}
