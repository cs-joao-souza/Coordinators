//
//  LoginViewController.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
  func didLogin()
}

class LoginViewController: UIViewController {

  var delegate: LoginViewControllerDelegate!
  
  // MARK: Lifcycle
  
  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  // MARK: IBActions
}
