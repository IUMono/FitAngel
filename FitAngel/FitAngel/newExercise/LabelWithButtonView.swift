//
//  LabelWithButtonView.swift
//  FitAngel
//
//  Created by Света on 16.12.2021.
//

import SwiftUI

struct LabelWithButtonView: View {
    let title: String
    let buttonTitle: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .padding()
                .font(.system(size: 16))
                .foregroundColor(.white)
            Spacer()
            Button {
                action()
            } label: {
                Text(buttonTitle)
                    .padding()
            }
            .foregroundColor(.gray)
            .background(Color.blackLight)
            .cornerRadius(20)
        }
    }
}

struct LabelWithButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LabelWithButtonView(title: "Название", buttonTitle: "Добавить", action: {
            
        })
    }
}
