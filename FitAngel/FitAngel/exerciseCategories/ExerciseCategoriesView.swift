//
//  ExerciseCategoriesView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 19.11.2021.
//

import SwiftUI

struct ExerciseCategoriesView: View {
    
//    @ObservedObject private var viewModel = ExerciseCategoriesViewModel()
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)])
    private var categories: FetchedResults<Category>
    
    @State private var isPresented = false
    
    var body: some View {
        
        ZStack {
            Color.blackLight.ignoresSafeArea()
            VStack {
                Button {
                    isPresented.toggle()
                } label: {
                    Spacer()
//                    NavigationLink("Создать упражнение", destination: AddNewExerciseView())
                    Text("Создать упражнение")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .sheet(isPresented: $isPresented, content: {
                    AddNewExerciseView()
                })
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
                
                HStack {
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: 1)
                        .foregroundColor(Color.gray)
                    
                    Text("или выберите базовые")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .layoutPriority(1)
                    
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: 1)
                        .foregroundColor(Color.gray)
                }
                
                ScrollView {
                    ForEach(categories) {
                        let model = ExerciseCategoryCellModel(imageName: $0.imageName ?? "", name: $0.name ?? "")
                        ExerciseGroupCell(model: model)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ExerciseCategoriesView()
    }
}

