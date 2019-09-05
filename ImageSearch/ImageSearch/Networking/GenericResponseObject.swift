//
//  GenericResponseObject.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//

import UIKit
import ObjectMapper

class GenericResponseObject<T:Mappable>: NSObject,Mappable {
  
  var result:T?
  var success:Bool?
  var error:ResponseError?
  
  required public init?(map: Map) {
  }
  
  public func mapping(map: Map) {
    result <- map["photos"]
    success <- map["success"]
    error <- map["error"]
  }
}

class GenericResponseArray<T:Mappable>: NSObject,Mappable {
  
  var result:[T]?
  var success:Bool?
  var error:ResponseError?
  
  required public init?(map: Map) {
  }
  
  public func mapping(map: Map) {
    result <- map["photos"]
    success <- map["success"]
    error <- map["error"]
  }
}

class ResponseError: NSObject,Mappable {
  
  var error_message:String?
  var error_code:String?
  
  required public init?(map: Map) {
  }
  
  public func mapping(map: Map) {
    error_message <- map["error_message"]
    error_code <- map["error_code"]
  }
}



