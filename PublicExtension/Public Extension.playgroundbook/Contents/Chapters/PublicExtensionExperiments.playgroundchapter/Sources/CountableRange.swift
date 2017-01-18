//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension CountableRange {
	public func indexPathRange(section: Int = 0) -> [IndexPath] {
		return map {
			guard let castedIndex = $0 as? Int else { fatalError("Only `Int`s allowed for NSIndexPaths!") }

			return IndexPath(row: castedIndex, section: section)
		}
	}
}

//: Credit to [@AirspeedSwift](https://twitter.com/AirspeedSwift)
extension CountableRange {
	public var mid: Bound {
		return startIndex.advanced(by:
			startIndex.distance(to: endIndex) / 2
		)
	}
}

//: Credit to [@calebd](https://twitter.com/calebd)
extension CountableRange where Bound.Stride == Bound {
	public func advance(by: Element) -> Range<Element> {
		return (startIndex + by)..<(endIndex + by)
	}
}

extension IndexPath: ExpressibleByStringLiteral {
	public init(stringLiteral: String) {
		let components = stringLiteral.components(separatedBy: CharacterSet(charactersIn: ",")).flatMap { Int($0, radix: 10) }
		self.init(row: components[0], section: components[1])
	}

	public init(extendedGraphemeClusterLiteral: String) {
		let components = extendedGraphemeClusterLiteral.components(separatedBy: CharacterSet(charactersIn: ",")).flatMap { Int($0, radix: 10) }
		self.init(row: components[0], section: components[1])
	}

	public init(unicodeScalarLiteral: String) {
		let components = unicodeScalarLiteral.components(separatedBy: CharacterSet(charactersIn: ",")).flatMap { Int($0, radix: 10) }
		self.init(row: components[0], section: components[1])
	}
}
