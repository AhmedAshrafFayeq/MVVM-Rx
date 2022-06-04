
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*
    1- similar to BehaviorSubject listen before supscription but in buffer size
    2- recieve anything after subscription but just with number of buffer size before subscription. 
 */

let accountSubject = ReplaySubject<Double>.create(bufferSize: 3)

accountSubject.onNext(124.226) // will not listened
accountSubject.onNext(224.226)
accountSubject.onNext(324.226)
accountSubject.onNext(424.226)


let accountManager = accountSubject.subscribe(onNext: {
    print("Account Manager: Transaction Amount: $\($0)")
})

accountSubject.onNext(20.98)
accountSubject.onNext(15.3773)
accountSubject.onNext(533.224)
accountSubject.onNext(245.1345)
accountSubject.onNext(5662.52)

print("\n")

let anotherSubscription = accountSubject.subscribe(onNext: {
    print("Another Subscription: Transaction Amount: $\($0)")
})
