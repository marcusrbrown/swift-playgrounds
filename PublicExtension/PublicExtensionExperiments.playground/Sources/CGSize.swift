//: [Table of Contents](Table%20of%20Contents)

import UIKit

//: Inspired by [@terhechte](https://twitter.com/terhechte)
extension CGSize: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		let size = CGSizeFromString(value)
		self.init(width: size.width, height: size.height)
	}

	public init(extendedGraphemeClusterLiteral value: String) {
		let size = CGSizeFromString(value)
		self.init(width: size.width, height: size.height)
	}

	public init(unicodeScalarLiteral value: String) {
		let size = CGSizeFromString(value)
		self.init(width: size.width, height: size.height)
	}
}

//: Inspired by [@soffes](https://twitter.com/soffes)
extension CGSize {
	public func aspectFit(boundingSize: CGSize) -> CGSize {
		let minRatio = min(boundingSize.width / width, boundingSize.height / height)
		return CGSize(width: width*minRatio, height: height*minRatio)
	}
}

//: Credit to [@rolandleth](https://twitter.com/rolandleth)
extension CGSize {
	public var delta: CGFloat {
		return 0.1 // Customize to your needs
	}

	public var isCompact: Bool { return height > width + delta }
	public var isWide: Bool { return width > height + delta }
	public var isSquare: Bool { return abs(width - height) < delta }
}
