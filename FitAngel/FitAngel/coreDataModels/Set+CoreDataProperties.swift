//
//  Set+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension WorkoutSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSet> {
        return NSFetchRequest<WorkoutSet>(entityName: "WorkoutSet")
    }

    @NSManaged public var date: Date?
    @NSManaged public var position: Int16
    @NSManaged public var workoutPosition: Int16
    @NSManaged public var category: Category?
    @NSManaged public var exercise: Exercise?
    @NSManaged public var workout: Workout?

}

extension WorkoutSet : Identifiable {

}
