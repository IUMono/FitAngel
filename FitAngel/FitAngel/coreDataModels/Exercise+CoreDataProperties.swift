//
//  Exercise+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var dateOfCreation: Date?
    @NSManaged public var isNew: Bool
    @NSManaged public var name: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var category: NSSet?
    @NSManaged public var muscle: NSSet?
    @NSManaged public var set: NSSet?

}

// MARK: Generated accessors for category
extension Exercise {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: Category)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: Category)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}

// MARK: Generated accessors for muscle
extension Exercise {

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
extension Exercise {

    @objc(addSetObject:)
    @NSManaged public func addToSet(_ value: WorkoutSet)

    @objc(removeSetObject:)
    @NSManaged public func removeFromSet(_ value: WorkoutSet)

    @objc(addSet:)
    @NSManaged public func addToSet(_ values: NSSet)

    @objc(removeSet:)
    @NSManaged public func removeFromSet(_ values: NSSet)

}

extension Exercise : Identifiable {

}
