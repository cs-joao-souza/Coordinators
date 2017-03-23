//
//  LoginViewController.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  var delegate: LoginViewControllerDelegate!
  
  // MARK: Lifcycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Login"
    hideNavigationItemBackButton()
  }
  
  // MARK: IBActions
  
  
  @IBAction func login(_ sender: Any) {
    let user = User()
    self.delegate?.didLogin(user: user)
  }
  
  
  @IBAction func useTerms(_ sender: Any) {
    self.delegate?.didPressedUseTerms()
  }
  
  
}
