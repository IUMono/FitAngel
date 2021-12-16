//
//  ListDataProvider.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 26.11.2021.
//

import Foundation

/// Общий поставщик данных для списка
class ListDataProvider<Item: ListDataItem>: ObservableObject {
    
    @Published var list: [Item] = []
    
    private(set) var listID: UUID = UUID()
    
    private let itemBatchSize: Int
    private let prefetchMargin: Int
    
    /// - Parameters:
    ///   - itemBatchCount: Number of items to fetch in each batch. It is recommended to be greater than number of rows displayed.
    ///   - prefetchMargin: How far in advance should the next batch be fetched? Greater number means more eager.
    ///   Sholuld be less than temBatchSize.
    init(itemBatchCount: Int = 20, prefetchMargin: Int = 3) {
        itemBatchSize = itemBatchCount
        self.prefetchMargin = prefetchMargin
        reset()
    }
    
    func reset() {
        list = []
        listID = UUID()
        fetchMoreItemsIfNeeded(currentIndex: -1)
    }
    
    /// Extend the list if we are close to the end, based on the specified index
    func fetchMoreItemsIfNeeded(currentIndex: Int) {
        print("fetchMoreItemsIfNeeded currentIndex = \(currentIndex)")
        guard currentIndex >= list.count - prefetchMargin else {
            return
        }
        let startIndex = list.count
        for currentIndex in startIndex ..< max(startIndex + itemBatchSize, currentIndex) {
            list.append(Item(index: currentIndex))
            list[currentIndex].fetchData()
        }
    }
    
    func fetchMoreItemsIfNeeded2(currentIndex: Int) {
        print("fetchMoreItemsIfNeeded currentIndex = \(currentIndex)")
        
        if currentIndex >= list.count - prefetchMargin {
            let startIndex = list.count
            for currentIndex in startIndex ..< max(startIndex + itemBatchSize, currentIndex) {
                list.append(Item(index: currentIndex))
                list[currentIndex].fetchData()
            }
        }
        
    }
}
