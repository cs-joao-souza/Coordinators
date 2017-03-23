//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  
  var rootViewController: UINavigationController
  
  var loginCoordinator: LoginCoordinator!
  var contentCoordinator: ContentCoordinator!
  
  var window: UIWindow!
  
  init(window: UIWindow, rootViewController: UINavigationController) {
    self.window = window
    self.rootViewController = rootViewController
  }
  
  func start() {
    self.window.rootViewController = self.rootViewController
    self.window.makeKeyAndVisible()
    
    showLogin()
  }
  
  func showLogin() {
    loginCoordinator = LoginCoordinator(rootViewController: self.rootViewController)
    loginCoordinator.start()
    
    loginCoordinator.finishModule = { user in      
      self.loginCoordinator = nil
      self.showContent()
    }
  }
  
  func showContent() {
    contentCoordinator = ContentCoordinator(rootViewController: self.rootViewController)
    contentCoordinator.start()
    
    contentCoordinator.finishModule = { 
      self.contentCoordinator = nil
      self.showLogin()
    }
  }
}
