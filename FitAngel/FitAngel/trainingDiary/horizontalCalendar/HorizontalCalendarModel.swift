//
//  HorizontalCalendarModel.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 07.12.2021.
//

import Foundation
import Combine

enum DayOfWeek: Int, CustomStringConvertible {
    case sunday = 1 // воскресенье
    case monday // понедельник
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var description: String {
        switch self {
        case .monday:
            return "пн"
        case .tuesday:
            return "вт"
        case .wednesday:
            return "ср"
        case .thursday:
            return "чт"
        case .friday:
            return "пт"
        case .saturday:
            return "сб"
        case .sunday:
            return "вс"
        }
    }
}

final class HorizontalCalendarItemModel: ListDataItem, ObservableObject {
    
    @Published var date: Date?
    @Published var hasTraining: Bool?
    
    var dayOfWeek: String {
        guard let date = date else {
            return ""
        }
        
        let weekDayComponent = Calendar.current.component(.weekday, from: date)
        
        return DayOfWeek(rawValue: weekDayComponent)?.description ?? ""
    }
    
    var dayOfMonth: String {
        guard let date = date else {
            return ""
        }
        
        let dayComponent = Calendar.current.component(.day, from: date)
        
        return String(dayComponent)
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
            dataPublisher = HorizontalCalendarDataStore.getDate(for: index)
                .receive(on: DispatchQueue.main)
                .sink { date in
                    self.date = date
            }
        }
    }
}
