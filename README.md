# TrackedValue

[![Build Status](https://github.com/konomae/TrackedValue/workflows/CI/badge.svg)](https://github.com/konomae/TrackedValue/actions) [![codecov](https://codecov.io/gh/konomae/TrackedValue/branch/master/graph/badge.svg)](https://codecov.io/gh/konomae/TrackedValue) [![cocoapods](https://img.shields.io/cocoapods/v/TrackedValue.svg)](https://cocoapods.org/pods/TrackedValue)

`TrackedValue` is a `struct` that determines whether a value has changed or not.

Original Idea: [ReactorKit#74](https://github.com/ReactorKit/ReactorKit/issues/74#issuecomment-418402997)


### Example

```swift
var v1 = TrackedValue(1)
let v2 = v1
v1 == v2 // true

v1.value = 1 // same value but new one assigned
v1 == v2 // false
```


### Use case

```swift
final class LoginReactor: Reactor {
    enum Action {
        case login
    }

    struct State {
        var error: Error?
    }

    let initialState = State()
}

final class LoginViewController: UIViewController, View {
    func bind(reactor: LoginReactor) {
        reactor.state.map { $0.error }
            // For some reasons, we need to skip if the error is same instance.
            // We can not use `distinctUntilChanged` here. 😭
            // Becase `Error` protocol is not `Equatable`.
            .distinctUntilChanged()
            .bind { [weak self] in self?.showError($0) }
            .disposed(by: disposeBag)
    }
}
```

If we use the `TrackedValue`, we can determine a value is changed or not.
Even if the original value is not `Equatable`.

```swift
final class LoginReactor: Reactor {
    enum Action {
        case login
    }

    struct State {
        var error: TrackedValue<Error?> = .init(nil)
    }

    let initialState = State()
}

final class LoginViewController: UIViewController, View {
    func bind(reactor: LoginReactor) {
        reactor.state.map { $0.error }
            // We can use `distinctUntilChanged`! 😀
            .distinctUntilChanged()
            .bind { [weak self] in self?.showError($0.value) }
            .disposed(by: disposeBag)
    }
}
```
