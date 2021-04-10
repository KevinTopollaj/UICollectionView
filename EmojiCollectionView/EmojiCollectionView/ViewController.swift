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

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = dataSource
    collectionView.delegate = delegate
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEmoji))
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

}

