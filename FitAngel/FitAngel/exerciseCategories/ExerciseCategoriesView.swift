//
//  ExerciseCategoriesView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 19.11.2021.
//

import SwiftUI

struct ExerciseCategory: Identifiable {
    let imageName: String
    let name: String
    let id = UUID()
}

struct ExerciseCategoriesView: View {
    
    var groupName = [
        ExerciseCategory(imageName: "Руки", name: "Руки"),
        ExerciseCategory(imageName: "Плечи", name: "Плечи"),
        ExerciseCategory(imageName: "Спина", name: "Спина"),
        ExerciseCategory(imageName: "Грудь", name: "Грудь"),
        ExerciseCategory(imageName: "Пресс", name: "Пресс"),
        ExerciseCategory(imageName: "Ноги", name: "Ноги"),
        ExerciseCategory(imageName: "Кардио", name: "Кардио")
    ]
    
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
                    ForEach(groupName) {
                        ExerciseGroupCell(model: $0)
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

