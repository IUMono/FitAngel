//
//  AddNewExercise.swift
//  FitAngel
//
//  Created by Света on 09.12.2021.
//

import SwiftUI

struct AddNewExercise: View {
    
    @State private var nameExercise: String = ""
    @State private var subtitle: String = ""

    var body: some View {
        ZStack {
            Color.darkGrey.ignoresSafeArea()
                .navigationTitle(nameExercise).foregroundColor(.white)
            VStack {
//                Text(String.nameExercise)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.white)
//                    .multilineTextAlignment(.leading)
//                    .padding()
                    
                TextField("", text: $nameExercise)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                    .placeholder(when: nameExercise.isEmpty) {
                        Text("Название упражнения").foregroundColor(.gray)
                }
                
                TextField("Подзаголовок", text: $subtitle)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                LabelWithButtonView(title: "Тип данных", buttonTitle: "Добавить") {
                    // TODO: реализовать добавление
                }
                
                LabelWithButtonView(title: "Категории", buttonTitle: "Добавить") {
                    // TODO: реализовать добавление
                }
                
                LabelWithButtonView(title: "Основные мышцы", buttonTitle: "Добавить") {
                    // TODO: реализовать добавление
                }
                
            }
        }
//    }
    }
}

struct AddNewExercise_Previews: PreviewProvider {
    static var previews: some View {
        AddNewExercise()
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blackLight, Color.blackLight]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15)
            .foregroundColor(.gray)
            .shadow(color: .darkGrey, radius: 10)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
            self
                placeholder()
                    .padding(.horizontal, 32.0)
                    .opacity(shouldShow ? 1 : 0)
                    
        }
    }
}



private extension String {
    static let nameExercise = "Новое упражнение"
    
}
