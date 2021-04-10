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
  let delegate = EmojiCollectionViewDelegate(numberOfItemsPerRow: 6, interItemSpacing: 8)
  
  var addBarButtonItem: UIBarButtonItem!
  var deleteBarButtonItem: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = dataSource
    collectionView.delegate = delegate
    
    collectionView.allowsMultipleSelection = true
    
    addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEmoji))
    deleteBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteEmoji))
    deleteBarButtonItem.isEnabled = false
    
    navigationItem.rightBarButtonItems = [addBarButtonItem, deleteBarButtonItem]
    navigationItem.leftBarButtonItem = editButtonItem
  }
  
  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    
    deleteBarButtonItem.isEnabled = isEditing
    addBarButtonItem.isEnabled = !isEditing
    
    collectionView.indexPathsForVisibleItems.forEach {
      guard let emojiCell = collectionView.cellForItem(at: $0) as? EmojiCell else { return }
      emojiCell.isEditing = editing
    }
    
    if !isEditing {
      collectionView.indexPathsForSelectedItems?.compactMap({ $0 }).forEach {
        collectionView.deselectItem(at: $0, animated: true)
      }
    }
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if isEditing && identifier == "showEmojiDetail" {
      return false
    }
    return true
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "showEmojiDetail",
          let emojiCell = sender as? EmojiCell,
          let emojiDetailController = segue.destination as? EmojiDetailController,
          let indexPath = collectionView.indexPath(for: emojiCell),
          let emoji = Emoji.shared.emoji(at: indexPath)
          else { return }
    
    emojiDetailController.emoji = emoji
  }
  
  @objc func addNewEmoji() {
    let (category, randomEmoji) = Emoji.randomEmoji()
    dataSource.addEmoji(randomEmoji, to: category)
    let emojiInSection = collectionView.numberOfItems(inSection: 0)
    let insertedIndex = IndexPath(item: emojiInSection, section: 0)
    collectionView.insertItems(at: [insertedIndex])
  }
  
  @objc func deleteEmoji() {
    guard let selectedIndices = collectionView.indexPathsForSelectedItems else { return }
    
    let sectionsWithSelectedItem = Set(selectedIndices.map({ $0.section }))
    sectionsWithSelectedItem.forEach { section in
      let indexPathForSection = selectedIndices.filter({ $0.section == section })
      let sortedIndexPaths = indexPathForSection.sorted(by: { $0.item > $1.item })
      
      dataSource.deleteEmojis(at: sortedIndexPaths)
      collectionView.deleteItems(at: sortedIndexPaths)
    }
  }

}

