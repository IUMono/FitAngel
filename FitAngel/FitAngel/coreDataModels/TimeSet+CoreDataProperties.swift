//
//  TimeSet+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension TimeSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeSet> {
        return NSFetchRequest<TimeSet>(entityName: "TimeSet")
    }

    @NSManaged public var timeMS: Int16

}
