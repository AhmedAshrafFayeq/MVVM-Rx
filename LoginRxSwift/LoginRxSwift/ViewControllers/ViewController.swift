//
//  ViewController.swift
//  LoginRxSwift
//
//  Created by Ahmed Fayeq on 30/04/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let viewModel   = LoginViewModel()
    private let disposeBag  = DisposeBag()
    let userDefaults        = UserDefaults.standard

    // Manage memory and clear everthing up for me
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.becomeFirstResponder()
        
        // Bind UI visual elements with ViewModel
        usernameTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.usernamePublishSibject).disposed(by: disposeBag)
        passwordTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.passwordPublishSubject).disposed(by: disposeBag)
        //map to non optional text
        
        viewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        viewModel.isValid().map{ $0 ? 1 : 0.1 }.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
    }
    @IBAction func didTapRegiterButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        UIApplication.shared.currentUIWindow()?.rootViewController = vc
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        UIApplication.shared.currentUIWindow()?.rootViewController = vc
        UIApplication.shared.currentUIWindow()?.makeKeyAndVisible()
        usernameTextField.rx.text.map { $0 ?? "" }.map{"Welcome, \($0)"}.bind(to: vc.nameLabel.rx.text)
    }
}
