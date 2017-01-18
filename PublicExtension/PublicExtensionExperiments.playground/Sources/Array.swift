//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension Array {
	public subscript(safe index: Index) -> Element? {
		return index < endIndex && index >= startIndex ? self[index] : nil
	}

	public init(withCapacity capacity: Int) {
		self.init()
		reserveCapacity(capacity)
	}
}

public protocol FloatingPointType {
	var doubleValue: Double { get }
}

extension Double: FloatingPointType {
	public var doubleValue: Double { return self }
}

extension Int: FloatingPointType {
	public var doubleValue: Double { return Double(self) }
}

extension Float: FloatingPointType {
	public var doubleValue: Double { return Double(self) }
}

extension CGFloat: FloatingPointType {
	public var doubleValue: Double { return Double(self) }
}

public func +(lhs: FloatingPointType, rhs: FloatingPointType) -> Double {
	return lhs.doubleValue + rhs.doubleValue
}

extension Array where Element: FloatingPointType {
	public func computeAverage() -> Double? {
		guard !isEmpty else { return nil }
		return reduce(0, +) / Double(count)
	}
}

//: Credit to [@JPMcGlone](https://twitter.com/JPMcGlone)
extension Array {
	public mutating func prepend(_ newElement: Element) {
		insert(newElement, at: 0)
	}
}
