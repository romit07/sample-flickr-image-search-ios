//
//  Photo+CoreDataProperties.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var id: String?
    @NSManaged public var owner: String?
    @NSManaged public var secret: String?
    @NSManaged public var server: String?
    @NSManaged public var farm: Int64
    @NSManaged public var title: String?
    @NSManaged public var ispublic: Int64
    @NSManaged public var isfriend: Int64
    @NSManaged public var isfamily: Int64

}
