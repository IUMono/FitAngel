//
//  HorizontalCalendarView.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 17.01.2022.
//

import UIKit
import SwiftUI

// Горизонтальный календарь
class HorizontalCalendarView: UIView {
    
    private let dataSource = HorizontalCalendarDataSource()
    
    private let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionLayout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var initialScrollDone = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: topAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: 62, height: 76)
        
        collectionView.register(HorizontalCalendarCollectionCell.self,
                                forCellWithReuseIdentifier: String(describing: HorizontalCalendarCollectionCell.self))
        
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func scrollToCenterItem() {
        collectionView.scrollToItem(at: IndexPath(row: dataSource.count / 2, section: .zero), at: .centeredHorizontally, animated: false)
        collectionView.selectItem(at: IndexPath(row: dataSource.count / 2, section: .zero), animated: false, scrollPosition: .centeredHorizontally)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !initialScrollDone {
            initialScrollDone = true
            scrollToCenterItem()
        }
    }
}
