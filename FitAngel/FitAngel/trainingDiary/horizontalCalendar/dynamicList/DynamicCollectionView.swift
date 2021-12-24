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
            LazyHStack {
                ForEach(listProvider.list) { item in
                    
                    Row(item: item)
                        .onAppear(perform: {
                            self.listProvider.fetchMoreItemsIfNeeded(currentIndex: item.index)
                        })
                        .frame(width: 62, height: 76)
                        .background(Color.blackDark)
                        .cornerRadius(20)
                }
            }
        }.frame(height: 76)
    }
}
