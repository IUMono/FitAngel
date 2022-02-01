//
//  HorizontalCalendarDataSource.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 01.02.2022.
//

import Foundation
import UIKit

class HorizontalCalendarDataSource: NSObject {
    
    let count = 10000
    
    let calendar = Calendar.current
    
    // TODO: поддержать актуальную дату, при заходе через день
    let today = Date()
    
    func getDate(for index: Int) -> HorizontalCalendarItemModel {
        let todayIndex = count / 2
        let value = index - todayIndex
        guard let date = calendar.date(byAdding: .day, value: value, to: today) else {
            assertionFailure("Что-то странное, не удалось получить дату, пофиксить")
            let dayComponent = calendar.component(.day, from: today)
            return HorizontalCalendarItemModel(dayComponent: dayComponent, dayOfWeek: .friday, isToday: true)
        }
        
        let weekComponent = calendar.component(.weekday, from: date)
        guard let dayOfWeek = HorizontalCalendarDayOfWeek(rawValue: weekComponent) else {
            assertionFailure("Что-то странное, не удалось получить день недели, пофиксить")
            let dayComponent = calendar.component(.day, from: today)
            return HorizontalCalendarItemModel(dayComponent: dayComponent, dayOfWeek: .friday, isToday: true)
        }
        
        let dayComponent = calendar.component(.day, from: date)
        let isToday = date == today
        
        return HorizontalCalendarItemModel(dayComponent: dayComponent, dayOfWeek: dayOfWeek, isToday: isToday)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HorizontalCalendarDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: HorizontalCalendarCollectionCell.self),
            for: indexPath) as? HorizontalCalendarCollectionCell else {
                
                return UICollectionViewCell()
            }
        let model = getDate(for: indexPath.row)
        cell.setup(day: model.dayComponent, week: model.dayOfWeek, backgroundColor: model.isToday ? .blackLight : .blackDark)
        return cell
    }
}
