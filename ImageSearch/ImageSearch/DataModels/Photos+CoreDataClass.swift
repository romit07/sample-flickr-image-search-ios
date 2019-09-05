//
//  Photos+CoreDataClass.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//
//

import Foundation
import CoreData
import ObjectMapper

@objc(Photos)
public class Photos: NSManagedObject, Mappable {
  override public init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
    super.init(entity:entity, insertInto:CoreDataUtil.shared.getMainContext())
  }
  
  public required init?(map: Map) {
    let ctx = CoreDataUtil.shared.getMainContext()
    let entity = NSEntityDescription.entity(forEntityName: "Photos", in: ctx)
    super.init(entity: entity! , insertInto: ctx)
    mapping(map: map)
  }
  
  public func mapping(map: Map) {
    page <- map["page"]
     pages <- map["pages"]
     perpage <- map["perpage"]
     total <- map["total"]
     photo <- map["photo"]
  }
}

