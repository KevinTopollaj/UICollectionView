//
//  DataSource.swift
//  EmojiCollectionView
//
//  Created by Kevin Topollaj on 10.4.21.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
  
  let emoji = Emoji.shared
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    emoji.sections.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let category = emoji.sections[section]
    let emojis = self.emoji.data[category]
    return emojis?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let emojiCell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCell.reuseIdentifier, for: indexPath) as? EmojiCell else { fatalError("Cell can not be created") }
    
    let category = emoji.sections[indexPath.section]
    let emoji = self.emoji.data[category]?[indexPath.item] ?? ""
    emojiCell.emojiLabel.text = emoji
    
    return emojiCell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    guard let emojiHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EmojiHeaderView.reuseIdentifier, for: indexPath) as? EmojiHeaderView else {
      fatalError("Cannot create EmojiHeaderView")
    }
    
    let category = emoji.sections[indexPath.section]
    emojiHeaderView.textLabel.text = category.rawValue
    
    return emojiHeaderView
  }
}

extension DataSource {
  func addEmoji(_ emoji: String, to category: Emoji.Category) {
    guard var emojiData = self.emoji.data[category] else { return }
    emojiData.append(emoji)
    self.emoji.data.updateValue(emojiData, forKey: category)
  }
}
