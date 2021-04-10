# UICollectionView

* UICollectionView provides the data source protocol to the queue for creating reusable cells.

* UICollectionView provides the delegate protocol to handle interaction in each cell.

* Unlike the table view that layouts each cell uses a fixed width, UICollectionView provides a way for developers to provide their own custom layout by subclassing UICollectionViewLayout if they want to.

* UICollectionView provides a concrete implementation witch is UICollectionViewFlowLayout.

* UICollectionViewFlowLayout displays items using a grid based system, it also provides two scrolling directions vertical and horizontal.

* In the vertical scroll direction the width of each item is constrained within the width of the collection view bounds, for each row the flow layout will try to fill as many items as possible before moving down in the new line.

* In the horizontal scroll direction the height of each item is constrained within the height of the collection view bounds, for each column the flow layout will try to fill as many items as possible before moving to the next column.
