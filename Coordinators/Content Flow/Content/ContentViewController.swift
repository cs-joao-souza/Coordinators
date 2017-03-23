//
//  ContentViewController.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

  var delegate: ContentViewControllerDelegate?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Conteúdo"
    createLogoutButton()
    hideNavigationItemBackButton()
  }
  
  // MARK: Private
  
  private func createLogoutButton() {
    let closeBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(ContentViewController.logout(sender:)))
    self.navigationItem.rightBarButtonItem = closeBarButtonItem
  }
  
  // MARK: Public
  
  func logout(sender: UIBarButtonItem) {
    self.delegate?.didLogout()
  }
}
