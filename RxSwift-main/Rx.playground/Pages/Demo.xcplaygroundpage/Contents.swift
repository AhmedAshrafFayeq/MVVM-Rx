import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let numberSequence = Observable.just(5)
let numberSubscriptiopn = numberSequence.subscribe(onNext: {
    print($0)
})

let helloSequence = Observable.from(["H","E","L","L","O"])

let helloSubscription = helloSequence.subscribe { event in
    switch event {
    case .next(let value):
        print(value)
    case .error(let error):
        print(error)
    case .completed:
        print("Completed")
    }
}
