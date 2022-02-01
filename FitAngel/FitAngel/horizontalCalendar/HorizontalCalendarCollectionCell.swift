//
//  HorizontalCalendarCollectionCell.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 24.01.2022.
//

import Foundation
import UIKit
import SwiftUI

// Ячейка горизонтального календаря
final class HorizontalCalendarCollectionCell: UICollectionViewCell {
    private let dayLabel = UILabel()
    
    private let weekLabel = UILabel()
    
    private var unselectedBackgroundColor = UIColor.white
    
    override var isSelected: Bool {
        didSet {
            setupSelectionStyle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 20
        contentView.addSubview(dayLabel)
        contentView.addSubview(weekLabel)
        
        
        weekLabel.textAlignment = .center
        weekLabel.font = UIFont.systemFont(ofSize: 12)
        weekLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([weekLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                                     weekLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     weekLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     weekLabel.heightAnchor.constraint(equalToConstant: 16)])
        dayLabel.textAlignment = .center
        dayLabel.font = UIFont.systemFont(ofSize: 16)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([dayLabel.topAnchor.constraint(equalTo: weekLabel.bottomAnchor, constant: 4),
                                     dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     dayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(day: Int, week: HorizontalCalendarDayOfWeek, backgroundColor: UIColor) {
        dayLabel.text = day.description
        weekLabel.text = week.description
        unselectedBackgroundColor = backgroundColor
        setupSelectionStyle()
        
    }
    
    private func setupSelectionStyle() {
        if isSelected {
            contentView.backgroundColor = .white
            dayLabel.textColor = .black
            weekLabel.textColor = .black
        } else {
            contentView.backgroundColor = unselectedBackgroundColor
            dayLabel.textColor = .white
            weekLabel.textColor = .white
        }
    }
}
