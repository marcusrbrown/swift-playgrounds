//: [Table of Contents](Table%20of%20Contents)

public enum Result<T, ErrorProtocol: Error> {
	case Success(T)
	case Failure(ErrorProtocol)

	// See full implementation at https://github.com/antitypical/Result
}

//: Credit to [@pearapps](https://twitter.com/pearapps)
extension Result {
	public func peek() -> T? {
		switch self {
		case let .Success(result):
			return result
		default:
			return nil
		}
	}
}

extension Result {
	public func dematerialize() throws -> T {
		switch self {
		case let .Success(value):
			return value
		case let .Failure(error):
			throw error
		}
	}
}
