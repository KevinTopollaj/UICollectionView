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
  
  var isEditing: Bool = false
  
  override var isSelected: Bool {
    didSet {
      if isEditing {
        contentView.backgroundColor = isSelected ? UIColor.systemRed.withAlphaComponent(0.5) : UIColor.systemGray3
      } else {
        contentView.backgroundColor = UIColor.systemGray3
      }
    }
  }
  
}
