//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension OperationQueue {
	public func addOperations(operations: [Operation]) {
		operations.forEach(addOperation)
	}
}
