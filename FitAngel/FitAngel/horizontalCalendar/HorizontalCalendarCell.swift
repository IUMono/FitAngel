//
//  HorizontalCalendarCell.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 04.12.2021.
//

import SwiftUI

// Ячейка горизонтального календаря
struct HorizontalCalendarCell: DynamicListRow {
    
    @ObservedObject var item: HorizontalCalendarItem
    
    init(item: HorizontalCalendarItem) {
        self.item = item
    }
    
    var body: some View {
        VStack {
            Text(self.item.dayOfWeek)
                .frame(width: 60, alignment: .leading)
                .font(.callout)
            Text(self.item.dayOfMonth)
                .frame(width: 100, alignment: .leading)
                .font(.callout)
        }
    }
}

struct HorizontalCalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendarCell(item: HorizontalCalendarItem(index: 1))
            .background(Color.gray)
    }
}
