//
//  DynamicListRow.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 26.11.2021.
//

import SwiftUI

/// Представление для строки списка
protocol DynamicListRow: View {
    associatedtype Item: ListDataItem
    var item: Item { get }
    init(item: Item)
}
