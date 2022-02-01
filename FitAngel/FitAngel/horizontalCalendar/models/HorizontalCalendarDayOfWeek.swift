//
//  HorizontalCalendarDayOfWeek.swift
//  FitAngel
//
//  Created by Света on 01.02.2022.
//

import Foundation

enum HorizontalCalendarDayOfWeek: Int, CustomStringConvertible {
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
