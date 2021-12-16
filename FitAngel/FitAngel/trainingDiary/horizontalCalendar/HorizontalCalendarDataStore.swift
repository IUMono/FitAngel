//
//  HorizontalCalendarDataStore.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 07.12.2021.
//

import Foundation
import Combine

struct HorizontalCalendarDataStore {
    
    // TODO: отредактировать
    static func getDate(for index: Int) -> AnyPublisher<Date?, Never> {
        
        let calendar = Calendar.current
        
        let date = Date()
        
        return Just(calendar.date(byAdding: .day, value: index, to: date))
            .subscribe(on: DispatchQueue.global(qos: .background))
            .eraseToAnyPublisher()
    }
}
