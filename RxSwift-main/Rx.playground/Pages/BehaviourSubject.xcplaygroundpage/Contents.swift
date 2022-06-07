
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*  1- take initial value
    2- get most recent value (any other subscription)
    3- focus on getting anything after subscription
*/
let disposeBag = DisposeBag()
let behaviorSubject = BehaviorSubject(value: "Value A")
behaviorSubject.onNext("Value C")
behaviorSubject.onNext("Value D")
behaviorSubject.onNext("Value E") //most recent before subscribtion

let subscriptionOne = behaviorSubject.subscribe(onNext: {
    print("Subscription 1: \($0)")
}).disposed(by: disposeBag)

behaviorSubject.onNext("Value B")

let subscriptionTwo = behaviorSubject.subscribe(onNext: {
    print("Subscription 2: \($0)")
}).disposed(by: disposeBag)

behaviorSubject.onNext("both Subscription")
