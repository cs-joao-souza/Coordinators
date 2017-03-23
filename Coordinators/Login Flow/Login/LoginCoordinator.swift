//
//  LoginCoordinator.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator, LoginCoordinatorOutput {
  
  var finishModule: ((User) -> ())?
  
  var rootViewController: UINavigationController
  
  var useTermsCoordinator: UseTermsCoordinator!
  
  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
  }
  
  func start() {
    let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    loginViewController.delegate = self
    self.rootViewController.setViewControllers([loginViewController], animated: true)
  }
}

extension LoginCoordinator: LoginViewControllerDelegate {
  func didLogin(user: User) {    
    if let finishModule = self.finishModule?(user) {
      finishModule
    }
  }
  
  func didPressedUseTerms() {
    useTermsCoordinator = UseTermsCoordinator(rootViewController: self.rootViewController)
    useTermsCoordinator.start()
    
    useTermsCoordinator.finishModule = {
      self.useTermsCoordinator = nil
    }        
  }
}
