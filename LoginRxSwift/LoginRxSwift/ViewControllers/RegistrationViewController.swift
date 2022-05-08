//
//  RegistrationViewController.swift
//  LoginRxSwift
//
//  Created by Ahmed Fayeq on 01/05/2022.
//

import UIKit
import RxSwift

class RegistrationViewController: UIViewController {
    
    let viewModel       = RegisterViewModel()
    let disposeBag      = DisposeBag()
    let userDefaults    = UserDefaults.standard
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.rx.text.map{ $0 ?? "" }.bind(to: viewModel.firstNamePublishSubject).disposed(by: disposeBag)
        lastNameTextField.rx.text.map{ $0 ?? "" }.bind(to: viewModel.lastNamePublishSubject).disposed(by: disposeBag)
        emailTextField.rx.text.map{ $0 ?? "" }.bind(to: viewModel.emailPublishSubject).disposed(by: disposeBag)
        
        viewModel.isValid().bind(to: registerButton.rx.isEnabled).disposed(by: disposeBag)
        viewModel.isValid().map{ $0 ? 1 : 0.1 }.bind(to: registerButton.rx.alpha).disposed(by: disposeBag)
    
    }

    @IBAction func didTapRegisterButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        UIApplication.shared.currentUIWindow()?.rootViewController = vc
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
        Observable.combineLatest(firstNameTextField.rx.text.map{ $0 ?? "" }, lastNameTextField.rx.text.map{ $0 ?? "" }){$0 + " " + $1}.map {
            "Welcome, \($0)"
        }.bind(to: vc.nameLabel.rx.text).disposed(by: disposeBag)
    }
}
    
