//#-hidden-code
import UIKit
//#-end-hidden-code

//: [Previous](@previous)
import UIKit

enum IndexPathWrapper: IndexPath {
	case header = "0,0"
	case footer = "3,0"

	// ...
}

let a = IndexPathWrapper(rawValue: IndexPath(row: 0, section: 0))
let b = a?.rawValue
//: [Next](@next)