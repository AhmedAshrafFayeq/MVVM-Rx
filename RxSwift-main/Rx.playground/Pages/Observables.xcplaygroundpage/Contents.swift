import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let numberSequence = Observable.just(5)
let numberSubscriptiopn = numberSequence.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

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
}.disposed(by: disposeBag)
