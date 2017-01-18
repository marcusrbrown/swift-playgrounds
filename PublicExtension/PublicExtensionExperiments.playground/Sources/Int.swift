//: [Table of Contents](Table%20of%20Contents)

import Foundation

extension Int {
	public func repeatClosure(closure: () -> Void) {
		(0..<self).forEach { _ in
			closure()
		}
	}

	// MARK: - Random `Int` in specific bounds
	//: From the QuickCheck chapter in [Functional Programming in Swift](https://www.objc.io/books/fpinswift/)!
	public static func random(from: Int, to: Int) -> Int {
		return from + Int(arc4random_uniform(UInt32(to - from)))
	}

	public var digits: [Int] {
		return String(self).characters.flatMap { Int(String($0)) }
	}
}

extension Int {
	public func gcd(other: Int) -> Int {
		guard other != 0 else { return abs(self) }

		return abs(other.gcd(other: self % other))
	}
}
