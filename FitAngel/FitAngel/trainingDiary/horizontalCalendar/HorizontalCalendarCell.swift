//
//  HorizontalCalendarCell.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 04.12.2021.
//

import SwiftUI

// Ячейка горизонтального календаря
struct HorizontalCalendarCell: DynamicListRow {
    
    @ObservedObject var item: HorizontalCalendarItemModel
    
    init(item: HorizontalCalendarItemModel) {
        self.item = item
    }
    
    var body: some View {
        VStack {
            Text(self.item.dayOfWeek)
                .frame(alignment: .center)
                .font(.system(size: 12))
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 4, trailing: 8))
            Text(self.item.dayOfMonth)
                .frame(alignment: .center)
                .font(.system(size: 16))
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8))
        }
    }
}

struct HorizontalCalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendarCell(item: HorizontalCalendarItemModel(index: 1)).background(Color.gray)
    }
}
