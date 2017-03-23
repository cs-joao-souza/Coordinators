//
//  LoginCoordinatorMock.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit
@testable import Coordinators

class LoginViewControllerDelegateMock: LoginViewControllerDelegate {
  var didLogginWasCalled = false
  var didPressedUseTermsCalled = false
  
  func didLogin(user: User) {
    
  }
  
  func didPressedUseTerms() {
    
  }
}
