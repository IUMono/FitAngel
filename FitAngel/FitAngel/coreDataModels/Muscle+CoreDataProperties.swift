//
//  Muscle+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension Muscle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Muscle> {
        return NSFetchRequest<Muscle>(entityName: "Muscle")
    }

    @NSManaged public var name: String?
    @NSManaged public var category: NSSet?
    @NSManaged public var exercise: NSSet?

}

// MARK: Generated accessors for category
extension Muscle {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: Category)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: Category)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}

// MARK: Generated accessors for exercise
extension Muscle {

    @objc(addExerciseObject:)
    @NSManaged public func addToExercise(_ value: Exercise)

    @objc(removeExerciseObject:)
    @NSManaged public func removeFromExercise(_ value: Exercise)

    @objc(addExercise:)
    @NSManaged public func addToExercise(_ values: NSSet)

    @objc(removeExercise:)
    @NSManaged public func removeFromExercise(_ values: NSSet)

}

extension Muscle : Identifiable {

}
