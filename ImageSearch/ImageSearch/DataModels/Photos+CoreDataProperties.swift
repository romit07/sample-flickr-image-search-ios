//
//  Photos+CoreDataProperties.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Photos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photos> {
        return NSFetchRequest<Photos>(entityName: "Photos")
    }

    @NSManaged public var page: Int64
    @NSManaged public var pages: Int64
    @NSManaged public var perpage: Int64
    @NSManaged public var total: String?
    @NSManaged public var photo: [Photo]?

}
