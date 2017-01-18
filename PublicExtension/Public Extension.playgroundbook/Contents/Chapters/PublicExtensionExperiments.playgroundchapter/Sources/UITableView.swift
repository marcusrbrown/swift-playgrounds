//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UITableView {
	public func registerReusable<T: Reusable>(cellClass: T.Type) {
		register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
	}

	public func dequeueReusable<T: Reusable>(cellClass: T.Type) -> T {
		guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as? T else {
			fatalError("Misconfigured cell type, \(cellClass)!")
		}

		return cell
	}

	public func dequeueReusable<T: Reusable>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Misconfigured cell type, \(cellClass)!")
		}

		return cell
	}
}

//: Credit to [@irace](https://twitter.com/irace)
extension UITableView {
	public func selectAllRows() {
		indexPaths.forEach(selectRow)
	}

	private func selectRow(indexPath: IndexPath) {
		selectRow(at: indexPath, animated: false, scrollPosition: .none)
	}

	private struct IndexPathSequence: Sequence {
		private let tableView: UITableView

		fileprivate init(tableView: UITableView) {
			self.tableView = tableView
		}

		func makeIterator() -> AnyIterator<IndexPath> {
			var (section, row) = (0, 0)

			return AnyIterator {
				guard section < self.tableView.numberOfSections else { return nil }

				let indexPath = IndexPath(row: row, section: section)

				if row < self.tableView.numberOfRows(inSection: section) - 1 {
					row += 1
				}
				else {
					section += 1
					row = 0
				}

				return indexPath
			}
		}
	}

	/**
	*  A sequence of this table view's index paths
	*
	*  Don't save iterators from this sequence because the backing table view's data source could change.
	*  Only use this for in-line computations (e.g. filtering or fast enumeration).
	*/
	private var indexPaths: IndexPathSequence {
		return IndexPathSequence(tableView: self)
	}
}
