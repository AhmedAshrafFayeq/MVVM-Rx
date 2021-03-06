//
//  LoginViewModel.swift
//  LoginRxSwift
//
//  Created by Ahmed Fayeq on 30/04/2022.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernamePublishSibject = PublishSubject<String>()
    let passwordPublishSubject = PublishSubject<String>()
    
    
    func isValid() -> Observable<Bool> {
        
        return Observable.combineLatest(
            usernamePublishSibject.asObservable().startWith(""),
            passwordPublishSubject.asObservable().startWith("")
        ).map { username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
    //we know it's gonna be empty when this first load
}
