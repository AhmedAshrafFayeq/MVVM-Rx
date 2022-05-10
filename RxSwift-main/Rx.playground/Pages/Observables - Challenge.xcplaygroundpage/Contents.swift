
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let numberSequence = Observable.from([1,2,3,4,5,6,7,8])
let numberSupscription = numberSequence.subscribe (onNext: {
    var number = $0 * 5
    print(number)
}).disposed(by: disposeBag)
