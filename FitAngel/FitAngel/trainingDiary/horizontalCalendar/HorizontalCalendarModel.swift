//
//  HorizontalCalendarModel.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 07.12.2021.
//

import Foundation
import Combine

final class HorizontalCalendarItemModel: ListDataItem, ObservableObject {
    
    @Published var date: Date?
    
    var dayOfWeek: String {
        return "пн"
    }
    
    var dayOfMonth: String {
        return "11"
    }
    
    var index: Int = 0
    
    var dataIsFetched: Bool {
        date != nil
    }
    
    private var dataPublisher: AnyCancellable?
    
    init(index: Int) {
        self.index = index
    }
    
    func fetchData() {
        if !dataIsFetched {
            dataPublisher = HorizontalCalendarDataStore.getDate(forIndex: index)
                .receive(on: DispatchQueue.main)
                .sink { date in
                    self.date = date
            }
        }
    }
}
