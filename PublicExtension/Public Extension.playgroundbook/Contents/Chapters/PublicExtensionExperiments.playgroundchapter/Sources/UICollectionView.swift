//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UICollectionView {
	public func registerReusable<T: Reusable>(cellClass: T.Type) {
		register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
	}

	public func dequeueReusable<T: Reusable>(cellClass: T.Type, forIndexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: forIndexPath) as? T else {
			fatalError("Misconfigured cell type, \(cellClass)!")
		}

		return cell
	}
}
