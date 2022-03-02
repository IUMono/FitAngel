//
//  WeightRepeatSet+CoreDataProperties.swift
//  FitAngel
//
//  Created by Ирина Моногошева on 08.02.2022.
//
//

import Foundation
import CoreData


extension WeightRepeatSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightRepeatSet> {
        return NSFetchRequest<WeightRepeatSet>(entityName: "WeightRepeatSet")
    }

    @NSManaged public var repeats: Int16
    @NSManaged public var weight: Int16

}
