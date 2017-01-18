//: [Table of Contents](Table%20of%20Contents)

import UIKit

public struct Complex: SignedNumber {
	let real: Double
	let imaginary: Double

	var modulus: Complex {
		return Complex(sqrt(real*real + imaginary*imaginary), 0)
	}

	public init(integerLiteral value: Int) {
		real = Double(value)
		imaginary = 0
	}

	public init(_ real: Double, _ imaginary: Double) {
		self.real = real
		self.imaginary = imaginary
	}

	// ...
}

public func ==(lhs: Complex, rhs: Complex) -> Bool {
	return lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
}

public func <(lhs: Complex, rhs: Complex) -> Bool {
	return lhs.modulus.real < rhs.modulus.real
}

prefix public func -(x: Complex) -> Complex {
	return Complex(-x.real, -x.imaginary)
}

public func -(lhs: Complex, rhs: Complex) -> Complex {
	return Complex(lhs.real - rhs.real, lhs.imaginary - rhs.imaginary)
}

extension Complex: AbsoluteValuable {
	public static func abs(_ x: Complex) -> Complex {
		return x.modulus
	}
}
