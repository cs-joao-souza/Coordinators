//
//  LoginViewControllerDelegate.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
  func didLogin(user: User)
  func didPressedUseTerms()
}
