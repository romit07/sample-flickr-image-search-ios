//
//  SearchImageCollectionViewCell.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//

import UIKit
import Kingfisher

class SearchImageCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var searchImageView: UIImageView!
  
  var photoObj : Photo! {
    didSet {
      setupImages()
    }
  }
  
  func setupImages() {
    if let server = photoObj.server,let id = photoObj.id,let secret = photoObj.secret {
      let urlString = "https://farm\(photoObj.farm).staticflickr.com/\(server)/\(id)_\(secret)_s.jpg"
      let url = URL(string: urlString)
      if url != nil {
        searchImageView.kf.setImage(with: url)
      }
    }
  }
}
