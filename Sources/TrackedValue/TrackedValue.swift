private final class Token {}

struct TrackedValue<Value>: Equatable {
    private var token: Token

    var value: Value {
        didSet {
            self.token = Token()
        }
    }

    init(_ value: Value) {
        self.token = Token()
        self.value = value
    }

    static func == (lhs: TrackedValue<Value>, rhs: TrackedValue<Value>) -> Bool {
        return lhs.token === rhs.token
    }
}
