//
//  RegisterViewModel.swift
//  LoginRxSwift
//
//  Created by Ahmed Fayeq on 01/05/2022.
//

import Foundation
import RxSwift

class RegisterViewModel {
    
    let firstNamePublishSubject = PublishSubject<String>()
    let lastNamePublishSubject  = PublishSubject<String>()
    let emailPublishSubject     = PublishSubject<String>()
    
    func isValid()-> Observable<Bool> {
        return Observable.combineLatest(firstNamePublishSubject.asObservable().startWith(""),
                                        lastNamePublishSubject.asObservable().startWith(""),
                                        emailPublishSubject.asObservable().startWith("")).map { username, password, email in
            return username.count > 3 && password.count > 3 && email.contains("@")
        }.startWith(false)
    }
}
