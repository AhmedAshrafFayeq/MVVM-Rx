//
//  HomeViewController.swift
//  LoginRxSwift
//
//  Created by Ahmed Fayeq on 01/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    let userDefaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
}
