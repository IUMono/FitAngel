//
//  DynamicList.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 26.11.2021.
//

import SwiftUI
import Combine

/// Представление для динамического списка
struct DynamicList<Row: DynamicListRow>: View {
    @ObservedObject var listProvider: ListDataProvider<Row.Item>
    
    var body: some View {
        List.init(0 ..< listProvider.list.count, id: \.self) { index in
            Row(item: self.listProvider.list[index])
                .onAppear {
                    self.listProvider.fetchMoreItemsIfNeeded(currentIndex: index)
                }
        }
        .id(self.listProvider.listID)
    }
}
