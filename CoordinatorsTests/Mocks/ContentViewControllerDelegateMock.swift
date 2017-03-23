//
//  ContentViewControllerDelegateMock.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit
@testable import Coordinators

class ContentViewControllerDelegateMock: ContentViewControllerDelegate {
  var didLogoutWasCalled = false
  
  func didLogout() {
    didLogoutWasCalled = true
  }
}
