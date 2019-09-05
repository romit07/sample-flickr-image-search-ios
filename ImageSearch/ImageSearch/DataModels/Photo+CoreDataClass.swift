//
//  Photo+CoreDataClass.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//
//

import Foundation
import CoreData
import ObjectMapper

@objc(Photo)
public class Photo: NSManagedObject, Mappable {
  override public init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
    super.init(entity:entity, insertInto:CoreDataUtil.shared.getMainContext())
  }
  
  public required init?(map: Map) {
    let ctx = CoreDataUtil.shared.getMainContext()
    let entity = NSEntityDescription.entity(forEntityName: "Photo", in: ctx)
    super.init(entity: entity! , insertInto: ctx)
    mapping(map: map)
  }
  
  public func mapping(map: Map) {
    id <- map["id"]
    owner <- map["owner"]
    secret <- map["secret"]
    server <- map["server"]
    farm <- map["farm"]
    title <- map["title"]
    ispublic <- map["isPublic"]
    isfriend <- map["isfriend"]
    isfamily <- map["isfamily"]
  }
}

