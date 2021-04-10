//
//  ViewController.swift
//  CollectionView
//
//  Created by Kevin Topollaj on 10.4.21.
//

import UIKit

class ViewController: UIViewController {
  
  enum Section {
    case main
  }

  @IBOutlet weak var collectionView: UICollectionView!
  
  var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.collectionViewLayout = configureLayout()
    configureDataSource()
  }

  func configureLayout() -> UICollectionViewCompositionalLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .absolute(44.0))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    return UICollectionViewCompositionalLayout(section: section)
  }

  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: self.collectionView, cellProvider: { (collectionView, indexPath, number) -> UICollectionViewCell? in
      
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reuseIdentifier, for: indexPath) as? NumberCell else { fatalError("Can not create cell") }
      
      cell.label.text = number.description
      
      return cell
    })
    
    var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
    initialSnapshot.appendSections([.main])
    initialSnapshot.appendItems(Array(1...100), toSection: .main)
    
    dataSource.apply(initialSnapshot, animatingDifferences: false)
  }
  
}

