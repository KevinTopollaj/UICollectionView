//
//  ViewController.swift
//  EmojiCollectionView
//
//  Created by Kevin Topollaj on 10.4.21.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  let dataSource = DataSource()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = dataSource
  }


}

