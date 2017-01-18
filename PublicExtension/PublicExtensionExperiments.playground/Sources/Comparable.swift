//: [Table of Contents](Table%20of%20Contents)

//: Credit to [@aligatr](https://twitter.com/aligatr) and [@khanlou](https://twitter.com/khanlou)
extension Comparable {
	public func clamp(interval: ClosedRange<Self>) -> Self {
		return interval.clamped(to: self...self).lowerBound
	}

	public func clamp(interval: Range<Self>) -> Self {
		return interval.clamped(to: self..<self).upperBound
	}
}
