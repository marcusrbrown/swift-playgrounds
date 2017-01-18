//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIGestureRecognizer {
	public func requireGestureRecognizersToFail(recognizers: [UIGestureRecognizer]) {
		recognizers.forEach(require)
	}
}

//: Credit to [@bukovinski](https://twitter.com/bukovinski)
extension UIGestureRecognizer {
	public func cancel() {
		isEnabled = false
		isEnabled = true
	}
}
