//
//  LoginViewControllerSpec.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class LoginViewControllerSpec: QuickSpec {
  override func spec() {
    describe("LoginViewController") {
      
      let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
      
      describe("Lifecycle") {
        context("When viewDidLoad is called") {
          let _ = loginViewController.view
          
          it("Should have Login title") {
            expect(loginViewController.title).to(equal("Login"))
          }
          
          it("Should have NavigationItem backButtonHidden") {
            expect(loginViewController.navigationItem.hidesBackButton).to(beTrue())
          }
        }
      }
      
      describe("IBActions") {
        
        let loginViewControllerDelegateMock = LoginViewControllerDelegateMock()
        loginViewController.delegate = loginViewControllerDelegateMock
        
        context("When login action is called") {
          loginViewController.login(UIButton())
          
          it("Should call didLogin delegate method") {
            expect(loginViewControllerDelegateMock.didLogginWasCalled).to(beTrue())
          }
        }
        
        context("When useTerms action is called") {
          loginViewController.useTerms(UIButton())
          
          it("Should call didPressedUseTerms delegate method") {
            expect(loginViewControllerDelegateMock.didPressedUseTermsCalled).to(beTrue())
          }
          
        }
      }
    }
  }
}
