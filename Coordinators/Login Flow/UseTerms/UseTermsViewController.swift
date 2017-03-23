//
//  UseTermsViewController.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import UIKit

class UseTermsViewController: UIViewController {

  var delegate: UseTermsViewControllerDelegate?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Termos de Uso"
    createCloseButton()
  }
  
  // MARK: Private
  
  private func createCloseButton() {
    let closeBarButtonItem = UIBarButtonItem(title: "Fechar", style: .plain, target: self, action: #selector(UseTermsViewController.close(sender:)))
    self.navigationItem.rightBarButtonItem = closeBarButtonItem    
  }
  
  // MARK: Public
  
  func close(sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
    self.delegate?.didClose()
  }
}
