//
//  TimeDistanceSet+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension TimeDistanceSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeDistanceSet> {
        return NSFetchRequest<TimeDistanceSet>(entityName: "TimeDistanceSet")
    }

    @NSManaged public var distance: Int16
    @NSManaged public var timeMS: Int16

}
