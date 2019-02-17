private final class Token {}

public struct TrackedValue<Value>: Equatable {
    private var token: Token

    public var value: Value {
        didSet {
            self.token = Token()
        }
    }

    public init(_ value: Value) {
        self.token = Token()
        self.value = value
    }

    public static func == (lhs: TrackedValue<Value>, rhs: TrackedValue<Value>) -> Bool {
        return lhs.token === rhs.token
    }
}
