//
//  SettingsViewController.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 15.12.2021.
//

import Foundation
import UIKit
import SwiftUI

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
    }
}

struct SettingsViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> SettingsViewController {
        return SettingsViewController()
    }
    
    func updateUIViewController(_ uiViewController: SettingsViewController, context: Context) {
        
    }
    
}

//struct SettingsView: View {
//    var body: some View {
//        SettingsViewControllerRepresentable()
//    }
//}
