//: [Table of Contents](Table%20of%20Contents)

import UIKit
import Foundation

//: Credit to [@devxoul](https://github.com/devxoul)
public protocol Then {}
extension NSObject: Then {}

extension Then {
	public func then(block: (Self) -> Void) -> Self {
		block(self)
		return self
	}
}
