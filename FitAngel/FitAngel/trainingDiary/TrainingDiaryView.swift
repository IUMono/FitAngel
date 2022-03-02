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
    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(entity: Category.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)])
//    private var categories: FetchedResults<Category>
    
    @ObservedObject private var viewModel = TrainingDiaryViewModel()
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blackDark.ignoresSafeArea()
                VStack {
                    
                    HorizontalCalendarViewRepresentable()
                        .frame(width: nil, height: 76, alignment: .center)
                    
                    if $viewModel.titleCellModels.isEmpty {
                        
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
//                        ScrollView {
//                            ForEach(categories) {
//                                Text($0.name ?? "")
//                            }
//                        }
                        ScrollView {
                            ForEach(viewModel.titleCellModels) {
                                TrainingDiaryTitleCell(model: $0)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        isPresented.toggle()
                    } label: {
                        Spacer()
                        Text("Добавить упражнения")
                            .padding()
                        Spacer()
                    }
                    .sheet(isPresented: $isPresented, onDismiss: {
                        
                    }, content: { ExerciseCategoriesView()
                            .environment(\.managedObjectContext, managedObjectContext)
                    })
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
