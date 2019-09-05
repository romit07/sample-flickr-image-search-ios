//
//  MainViewController.swift
//  HikeSimulation
//
//  Created by Romit Kumar on 13/04/19.
//  Copyright © 2019 Romit Kumar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var searchInputTextField: UITextField!
  @IBOutlet weak var imageGridCollectionView: UICollectionView!
  
  var photos:Photos?
  var photoArray:[Photo] = [] {
    didSet {
      imageGridCollectionView.reloadData()
    }
  }
  var currentPage = 0
  var totalPage = 1
  var lastQuery = ""
  
  //MARK: Lifecycle methods
  override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  //MARRK: IBActions
  @IBAction func searchButtonTapped(_ sender: Any) {
    currentPage = 0
    totalPage = 0
    let query = searchInputTextField.text?.trimmingCharacters(in:
      CharacterSet.whitespaces)
    if let qr = query {
    if (qr != "") {
      hitAPI(query: qr, shouldAppend: true)
      lastQuery = qr
    }
    }
  }
  
  
  func hitAPI(query:String,shouldAppend:Bool) {
    print("api called")
    if (query == "") {
      return
    }
    var pageNumber = 0
    if (currentPage <= totalPage) {
      pageNumber = currentPage + 1
    }
    let params : [String:Any] = ["query": query, "page":pageNumber]
    APIService.shared.searchPhoto(params: params) { (success, photos, error) in
      if success {
        print(photos)
        if let ph = photos {
          self.photos=ph
          self.photoArray = shouldAppend ? (self.photoArray +  ph.photo!) :  ph.photo!
          self.totalPage = Int(ph.pages)
        }
      }
    }
  }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return photoArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchImageCollectionViewCell", for: indexPath) as! SearchImageCollectionViewCell
    cell.photoObj = photoArray[indexPath.row]
    if ( indexPath.row == photoArray.count  - 1 && lastQuery != "" && photoArray.count < totalPage){
         print("api reload")
      hitAPI(query: lastQuery, shouldAppend: true)
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.size.width/3, height:  UIScreen.main.bounds.size.width/3)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension MainViewController : UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //hitAPI(query: searchInputTextField.text!, shouldAppend: false)
    return true
  }
}
