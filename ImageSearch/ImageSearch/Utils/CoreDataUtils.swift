//
//  CoreDataUtils.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//


import Foundation
import CoreData
import UIKit


class CoreDataUtil {
  static let shared = CoreDataUtil()
  var container: NSPersistentContainer? = AppDelegate().persistentContainer
  var mainContext: NSManagedObjectContext? = AppDelegate().persistentContainer.viewContext
  var backGroundContext: NSManagedObjectContext? = AppDelegate().persistentContainer.newBackgroundContext()
  
  init() {
    setup()
  }
  
  func setup() {
    mainContext?.mergePolicy =  NSMergeByPropertyObjectTrumpMergePolicy
    backGroundContext?.mergePolicy =  NSMergeByPropertyObjectTrumpMergePolicy
  }
 
  func getMainContext() -> NSManagedObjectContext {
    let context = CoreDataUtil.shared.mainContext
    return context!
  }
  
  func save()  {
    do {
      try mainContext?.save()
    }catch {
      print("Error in saving\(error)")
    }
  }
  
}

