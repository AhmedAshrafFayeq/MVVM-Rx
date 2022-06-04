
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*  1- take initial value
    2- get most recent value (any other subscription)
    3- focus on getting anything after subscription
*/

let behaviorSubject = BehaviorSubject(value: "Value A")

let subscriptionOne = behaviorSubject.subscribe(onNext: {
    print("Subscription 1: \($0)")
})

behaviorSubject.onNext("Value B")

let subscriptionTwo = behaviorSubject.subscribe(onNext: {
    print("Subscription 2: \($0)")
})

behaviorSubject.onNext("both Subscription")
