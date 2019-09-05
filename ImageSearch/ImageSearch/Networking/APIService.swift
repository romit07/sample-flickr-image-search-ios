//
//  APIService.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIService {
  static let shared = APIService()
  
  open func searchPhoto(params: Parameters, completion: @escaping (Bool,Photos?,Any?) -> Void) {
     let query = params["query"]!
    let page = params["page"]!
    let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736&format=json&nojsoncallback=1&safe_search=1&text=\(query)&page=\(page)"
     let header : [String:String] = ["Content-Type" : "application/json"]
    Alamofire.request(url, method: .get, parameters: nil, headers: header).validate(statusCode: 200..<300).responseObject(completionHandler:  { (response: DataResponse<GenericResponseObject<Photos>>) in
      switch response.result {
      case .success(_) :
        print("success")
        completion(true,response.result.value?.result,nil)
      case .failure(_) :
        print("failure")
           completion(false,nil,"error")
      }
    })
  }
}

