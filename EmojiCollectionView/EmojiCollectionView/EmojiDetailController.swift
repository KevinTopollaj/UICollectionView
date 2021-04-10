//
//  EmojiDetailController.swift
//  EmojiCollectionView
//
//  Created by Kevin Topollaj on 10.4.21.
//

import UIKit

class EmojiDetailController: UIViewController {
  
  var emoji: String? {
    didSet {
      if let label = textLabel {
        label.text = emoji
      }
    }
  }
  
  @IBOutlet weak var textLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textLabel.text = emoji
  }
}
