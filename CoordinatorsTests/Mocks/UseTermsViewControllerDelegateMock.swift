//
//  UseTermsViewControllerDelegateMock.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit
@testable import Coordinators

class UseTermsViewControllerDelegateMock: UseTermsViewControllerDelegate {
  var didCloseWasCalled = false
  
  func didClose() {
    didCloseWasCalled = true
  }
}
