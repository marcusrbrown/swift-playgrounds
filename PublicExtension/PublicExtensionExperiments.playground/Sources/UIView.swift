//: [Table of Contents](Table%20of%20Contents)

import UIKit

extension UIView {
	public func addSubviews(views: [UIView]) {
		views.forEach(addSubview)
	}

	public var frameHeight: CGFloat {
		return frame.height
	}

	public var frameWidth: CGFloat {
		return frame.width
	}

	public convenience init(translatesAutoresizingMaskIntoConstraints: Bool) {
		self.init()
		self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
	}
}

public enum ViewTag: Int {
	case None
	case TitleLabel
	case LoginButton

	// etc.
}

//: Credit to [@rolandleth](https://twitter.com/rolandleth)
extension UIView {
	public var safeTag: ViewTag {
		get {
			return ViewTag(rawValue: tag) ?? .None
		}

		set {
			tag = newValue.rawValue
		}
	}

	public func viewWithTag(tag: ViewTag) -> UIView? {
		return viewWithTag(tag.rawValue)
	}
}

extension UIView {
	public var isRTL: Bool {
		return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
	}
}

//: Credit to [@JPMcGlone](https://twitter.com/JPMcGlone)
extension UIView {
	public func removeAllGestureRecognizers() {
		gestureRecognizers?.forEach(removeGestureRecognizer)
	}
}
