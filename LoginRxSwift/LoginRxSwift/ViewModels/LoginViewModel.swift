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
        return Observable.combineLatest(usernamePublishSibject.asObservable(), passwordPublishSubject.asObservable()).map { username, password in
            return username.count > 3 && password.count > 3
        }
    }
    
}
