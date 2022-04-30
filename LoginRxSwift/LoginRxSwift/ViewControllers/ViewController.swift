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

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        print("login button pressed")
    }
}
