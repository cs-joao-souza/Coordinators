//
//  ContentCoodinator.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class ContentCoordinator: Coordinator, ContentCoordinatorOutput {
  
  var finishModule: (() -> ())?
  
  var rootViewController: UINavigationController
  
  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
  }
  
  func start() {
    let contentViewController = UIStoryboard(name: "Content", bundle: nil).instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
    contentViewController.delegate = self
    self.rootViewController.setViewControllers([contentViewController], animated: true)
  }
}

extension ContentCoordinator: ContentViewControllerDelegate {
  func didLogout() {
    if let finishModule = self.finishModule?() {
      finishModule
    }
  }
}
