//
//  DynamicCollectionView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 26.11.2021.
//

import SwiftUI
import Combine

struct DynamicCollectionView<Row: DynamicListRow>: View {
    @ObservedObject var listProvider: ListDataProvider<Row.Item>
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(listProvider.list) {
                    Row(item: $0)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .padding(10)
                }
            }
        }
    }
}
