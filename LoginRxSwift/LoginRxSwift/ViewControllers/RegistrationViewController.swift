//
//  RegistrationViewController.swift
//  LoginRxSwift
//
//  Created by Ahmed Fayeq on 01/05/2022.
//

import UIKit
import RxSwift

class RegistrationViewController: UIViewController {
    
    let viewModel   = RegisterViewModel()
    let disposeBag  = DisposeBag()
    
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
    }
}
