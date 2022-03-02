//
//  FitAngelApp.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 19.11.2021.
//

import SwiftUI
import CoreData

@main
struct FitAngelApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TrainingDiaryView()
                .environment(\.managedObjectContext, appDelegate.persistentContainer.viewContext)
                .preferredColorScheme(.dark)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let userDefaults = UserDefaults.standard
        let defaultValues = [String.firstRunKey : true]
        userDefaults.register(defaults: defaultValues)
        
        if userDefaults.bool(forKey: String.firstRunKey) {
            saveDefaultCategories {
                userDefaults.set(false, forKey: String.firstRunKey)
            }
        }
        
        return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveDefaultCategories(successCompletion: (() -> Void)?) {
        
        let managedContext = persistentContainer.viewContext
        
        let categoryNames = ["Руки", "Плечи", "Спина", "Грудь", "Пресс", "Ноги", "Кардио"]
        
        categoryNames.forEach { categoryName in
            let category = Category(context: managedContext)
            category.name = categoryName
            category.imageName = categoryName
        
            
            if managedContext.hasChanges {
                do {
                    try managedContext.save()
                    successCompletion?()
                } catch {
                    managedContext.rollback()
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }
}

private extension String {
    static let firstRunKey = "firstRun"
}
