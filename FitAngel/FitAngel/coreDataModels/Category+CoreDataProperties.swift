//
//  Category+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var name: String?
    @NSManaged public var exercise: NSSet?
    @NSManaged public var muscle: NSSet?
    @NSManaged public var set: NSSet?

}

// MARK: Generated accessors for exercise
extension Category {

    @objc(addExerciseObject:)
    @NSManaged public func addToExercise(_ value: Exercise)

    @objc(removeExerciseObject:)
    @NSManaged public func removeFromExercise(_ value: Exercise)

    @objc(addExercise:)
    @NSManaged public func addToExercise(_ values: NSSet)

    @objc(removeExercise:)
    @NSManaged public func removeFromExercise(_ values: NSSet)

}

// MARK: Generated accessors for muscle
extension Category {

    @objc(addMuscleObject:)
    @NSManaged public func addToMuscle(_ value: Muscle)

    @objc(removeMuscleObject:)
    @NSManaged public func removeFromMuscle(_ value: Muscle)

    @objc(addMuscle:)
    @NSManaged public func addToMuscle(_ values: NSSet)

    @objc(removeMuscle:)
    @NSManaged public func removeFromMuscle(_ values: NSSet)

}

// MARK: Generated accessors for set
extension Category {

    @objc(addSetObject:)
    @NSManaged public func addToSet(_ value: WorkoutSet)

    @objc(removeSetObject:)
    @NSManaged public func removeFromSet(_ value: WorkoutSet)

    @objc(addSet:)
    @NSManaged public func addToSet(_ values: NSSet)

    @objc(removeSet:)
    @NSManaged public func removeFromSet(_ values: NSSet)

}

extension Category : Identifiable {

}
