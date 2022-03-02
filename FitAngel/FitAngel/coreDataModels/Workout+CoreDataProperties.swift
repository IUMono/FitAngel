//
//  Workout+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var date: Date?
    @NSManaged public var dateOfCreation: Date?
    @NSManaged public var duration: Int16
    @NSManaged public var set: NSSet?

}

// MARK: Generated accessors for set
extension Workout {

    @objc(addSetObject:)
    @NSManaged public func addToSet(_ value: WorkoutSet)

    @objc(removeSetObject:)
    @NSManaged public func removeFromSet(_ value: WorkoutSet)

    @objc(addSet:)
    @NSManaged public func addToSet(_ values: NSSet)

    @objc(removeSet:)
    @NSManaged public func removeFromSet(_ values: NSSet)

}

extension Workout : Identifiable {

}
