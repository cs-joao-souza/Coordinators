//
//  LoginCoordinator.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
  
  var rootViewController: UINavigationController!
  var childCoordinators: [Coordinator]!
  
  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
    self.childCoordinators = []
  }
  
  func start() {
    let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    self.rootViewController.pushViewController(loginViewController, animated: true)
  }
}
