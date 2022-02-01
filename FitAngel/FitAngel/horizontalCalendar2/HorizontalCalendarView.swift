//
//  HorizontalCalendarView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 17.01.2022.
//

import UIKit
import SwiftUI

struct DateItemModel {
    let dayComponent: Int
    let dayOfWeek: DayOfWeek
    let isToday: Bool
}

class CalendarDataSource: NSObject {
    
    let count = 10000
    
    let calendar = Calendar.current
    
    // TODO: поддержать актуальную дату, при заходе через день
    let today = Date()
    
    func getDate(for index: Int) -> DateItemModel {
        let value = index - (count / 2)
        guard let date = calendar.date(byAdding: .day, value: value, to: today) else {
            assertionFailure("Что-то странное, не удалось получить дату, пофиксить")
            return DateItemModel(dayComponent: calendar.component(.day, from: today), dayOfWeek: .friday, isToday: true)
        }
        let weekComponent = calendar.component(.weekday, from: date)
        guard let dayOfWeek = DayOfWeek(rawValue: weekComponent) else {
            assertionFailure("Что-то странное, не удалось получить день недели, пофиксить")
            return DateItemModel(dayComponent: calendar.component(.day, from: today), dayOfWeek: .friday, isToday: true)
        }
        let dayComponent = calendar.component(.day, from: date)
        
        return DateItemModel(dayComponent: dayComponent, dayOfWeek: dayOfWeek, isToday: date == today)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CalendarDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as? HorizontalCalendarCollectionCell else {
                
                return UICollectionViewCell()
            }
        let model = getDate(for: indexPath.row)
        cell.setup(day: model.dayComponent, week: model.dayOfWeek, backgroundColor: model.isToday ? .blackLight : .blackDark)
        return cell
    }
}

// Горизонтальный календарь
class HorizontalCalendarView: UIView {
    
    private let dataSource = CalendarDataSource()
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionLayout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: 62, height: 76)
        
        collectionView.register(HorizontalCalendarCollectionCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setup(delegate: UICollectionViewDelegate) {
//        collectionView.delegate = delegate
//    }
//
//    func setup(dataSource: UICollectionViewDataSource) {
//        collectionView.dataSource = dataSource
//    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func scrollToItem(at indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
    
    func scrollToCenterItem() {
        collectionView.scrollToItem(at: IndexPath(row: dataSource.count / 2, section: .zero), at: .centeredHorizontally, animated: false)
        collectionView.selectItem(at: IndexPath(row: dataSource.count / 2, section: .zero), animated: false, scrollPosition: .centeredHorizontally)
    }
    
    func selectItem(at indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollToCenterItem()
    }
}

//// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//
//extension HorizontalCalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        days.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView
//                .dequeueReusableCell(withReuseIdentifier: String(describing: HorizontalCalendarCollectionCell.self),
//                                     for: indexPath) as? HorizontalCalendarCollectionCell else {
//            return UICollectionViewCell()
//        }
//
//        cell.setup(day: days[indexPath.row])
//
//        return cell
//    }
//}
