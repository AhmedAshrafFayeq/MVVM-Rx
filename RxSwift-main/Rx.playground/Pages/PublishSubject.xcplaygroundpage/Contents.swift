
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// publishSubject will not do anything before subscription just after subscription
let publishSubject = PublishSubject<String>()

publishSubject.onNext("Hello")

publishSubject.subscribe(onNext: {
    print($0)
})

publishSubject.onNext("Heeeyyyy")

