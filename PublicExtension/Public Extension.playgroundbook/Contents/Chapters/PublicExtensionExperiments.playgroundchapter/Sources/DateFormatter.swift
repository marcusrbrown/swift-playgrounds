//: [Table of Contents](Table%20of%20Contents)

import Foundation

//: Credit to [@ZackShapiro](https://twitter.com/ZackShapiro)
extension DateFormatter {
	public convenience init(formatString: String) {
		self.init()
		dateFormat = formatString
	}
}
