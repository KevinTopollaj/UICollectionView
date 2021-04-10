//
//  NumberCell.swift
//  CollectionView
//
//  Created by Kevin Topollaj on 11.4.21.
//

import UIKit

class NumberCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: NumberCell.self)
  
  @IBOutlet weak var label: UILabel!
}
