//
//  ContentViewControllerSpec.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class ContentViewControllerSpec: QuickSpec {
  override func spec() {
    describe("ContentViewController") {
      
      let contentViewController = UIStoryboard(name: "Content", bundle: nil).instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
      
      describe("Lifecycle") {
        context("When viewDidLoad is called") {
          let _ = contentViewController.view
          
          it("Should have Conteúdo title") {
            expect(contentViewController.title).to(equal("Conteúdo"))
          }
          
          it ("Should create logout button") {
            let logoutBarButtonItem = contentViewController.navigationItem.rightBarButtonItem
            expect(logoutBarButtonItem).toNot(beNil())
            expect(logoutBarButtonItem?.title).to(equal("Logout"))
            expect(logoutBarButtonItem?.target).toNot(beNil())
            expect(logoutBarButtonItem?.action).toNot(beNil())
          }        
        }
      }
      
      
      describe("IBActions") {
        let contentViewControllerDelegateMock = ContentViewControllerDelegateMock()
        contentViewController.delegate = contentViewControllerDelegateMock
        
        context("When logout action is called") {
          contentViewController.logout(sender: UIBarButtonItem())
          
          it("Should call didLogout delegate method") {
            expect(contentViewControllerDelegateMock.didLogoutWasCalled).to(beTrue())
          }
        }
      }      
    }
  }
}
