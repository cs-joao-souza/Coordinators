//
//  UseTermsViewControllerSpec.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class UseTermsViewControllerSpec: QuickSpec {
  override func spec() {
    describe("UseTermsViewController") {
      
      let useTermsViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "UseTermsViewController") as! UseTermsViewController
      
      describe("Lifecycle") {
        context("When viewDidLoad is called") {
          let _ = useTermsViewController.view
          
          it("Should have Termos de Uso title") {
            expect(useTermsViewController.title).to(equal("Termos de Uso"))
          }
          
          it ("Should create close button") {
            let closeBarButtonItem = useTermsViewController.navigationItem.rightBarButtonItem
            expect(closeBarButtonItem).toNot(beNil())
            expect(closeBarButtonItem?.title).to(equal("Fechar"))
            expect(closeBarButtonItem?.target).toNot(beNil())
            expect(closeBarButtonItem?.action).toNot(beNil())
          }
        }
      }
      
      describe("IBActions") {
        let useTermsViewControllerDelegateMock = UseTermsViewControllerDelegateMock()
        useTermsViewController.delegate = useTermsViewControllerDelegateMock
        
        context("When close action is called") {
          useTermsViewController.close(sender: UIBarButtonItem())
          
          it("Should call didClose delegate method") {
            expect(useTermsViewControllerDelegateMock.didCloseWasCalled).to(beTrue())
          }
        }
      }
      
    }
  }
}
