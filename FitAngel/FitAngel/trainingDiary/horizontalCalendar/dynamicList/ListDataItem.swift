//
//  ListDataItem.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 26.11.2021.
//

import Foundation

/// Элемент списка данных. Должен содержать индекс (номер строки) как хранимое свойство
protocol ListDataItem: Identifiable {
    var index: Int { get set }
    
    /// Данные были получены?
    var dataIsFetched: Bool { get }
    
    init(index: Int)
    
    /// Получить дополнительные данные об элементе, возможно, асинхронно
    func fetchData()
}

