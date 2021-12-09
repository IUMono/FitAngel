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
    static func getDate(forIndex _: Int) -> AnyPublisher<Date, Never> {
        Just(Date())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map { val in usleep(UInt32.random(in: 500_000 ..< 2_000_000)); return val }
            .eraseToAnyPublisher()
    }
}
