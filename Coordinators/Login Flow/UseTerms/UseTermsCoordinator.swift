//
//  UseTermsCoordinator.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class UseTermsCoordinator: Coordinator, UseTermsCoordinatorOutput {
  
  var finishModule: (() -> ())?
  
  var rootViewController: UINavigationController
  
  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
  }
  
  func start() {
    showUseTerms()
  }
  
  func showUseTerms() {
    let useTermsViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "UseTermsViewController") as! UseTermsViewController
    useTermsViewController.delegate = self
    let navigationController = UINavigationController(rootViewController: useTermsViewController)
    self.rootViewController.present(navigationController, animated: true, completion: nil)        
  }
}

extension UseTermsCoordinator: UseTermsViewControllerDelegate {
  func didClose() {
    if let finishModule = self.finishModule?() {
      finishModule
    }
  }
}
