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
        
        dayLabel.textColor = .white
        dayLabel.textAlignment = .center
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([dayLabel.topAnchor.constraint(equalTo: topAnchor),
                                     dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(day: Int, backgroundColor: UIColor) {
        dayLabel.text = day.description
        unselectedBackgroundColor = backgroundColor
        setupSelectionStyle()
        
    }
    
    private func setupSelectionStyle() {
        if isSelected {
            contentView.backgroundColor = .white
            dayLabel.textColor = .black
        } else {
            contentView.backgroundColor = unselectedBackgroundColor
            dayLabel.textColor = .white
        }
    }
}
