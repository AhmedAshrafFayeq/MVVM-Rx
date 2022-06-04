
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let numberSequence = Observable.from([1,2,3,4,5,6,7,8])
let numberSupscription: () = numberSequence.subscribe (onNext: {
    let number = $0 * 5
    print(number)
}).disposed(by: disposeBag)



let array = ["ahmed", "ashraf", "fayeq"]
let arraySequenceObservable = Observable.from(array)
let _ = arraySequenceObservable.subscribe { event in
    switch event {
    case .next(let element):
        print(element.uppercased())
    case .error(let error):
        print(error.localizedDescription)
    case .completed:
        print("done")
    }
}.disposed(by: disposeBag)
