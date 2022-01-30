//
//  HorizontalCalendarViewRepresentable.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 24.01.2022.
//

import Foundation
import UIKit
import SwiftUI

struct HorizontalCalendarViewRepresentable: UIViewRepresentable {
//    @Binding var days: [Int]

    func makeUIView(context: Context) -> HorizontalCalendarView {
        HorizontalCalendarView()
    }

    func updateUIView(_ uiView: HorizontalCalendarView, context: Context) {
//        uiView.setup(days: days)
    }
}
