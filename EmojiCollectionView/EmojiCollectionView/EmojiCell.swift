//
//  EmojiCell.swift
//  EmojiCollectionView
//
//  Created by Kevin Topollaj on 10.4.21.
//

import UIKit

class EmojiCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: EmojiCell.self)
  
  @IBOutlet weak var emojiLabel: UILabel!
  
}
