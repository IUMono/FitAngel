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
    
    var body: some View {
        
        NavigationView {
        VStack {
            
            Button {
                
            } label: {
                Spacer()
                Text("Создать упражнение")
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
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
                        .background(Color(red: 0.157, green: 0.173, blue: 0.22, opacity: 1))
                }
            }
        }
    }
}
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ExerciseCategoriesView()
                .background(Color(red: 0.157, green: 0.173, blue: 0.22, opacity: 1), ignoresSafeAreaEdges: .all)
        } else {
            ExerciseCategoriesView()
                .background(Color(red: 0.157, green: 0.173, blue: 0.22, opacity: 1))
        }
    }
}



