//
//  LoginCoordinatorSpec.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class LoginCoordinatorSpec: QuickSpec {
  override func spec() {
    describe("LoginCoordinator") {
      
      let navigationController = UINavigationController()
      let sut = LoginCoordinator(rootViewController: navigationController)
      
      context("When it is initalizing") {
        it("Should has a rootViewController not nil") {
          expect(sut.rootViewController).toNot(beNil())
        }
      }
      
      context("When it starts") {
        
        beforeEach {
          sut.start()
        }
        
        it("Should have a LoginViewController as first viewcontroller in RootViewController") {
          expect(sut.rootViewController.viewControllers.first?.isKind(of: LoginViewController.self)).to(beTrue())
        }
        
        it("Should have a LoginViewController delegate setted") {
          expect((sut.rootViewController.viewControllers.first as! LoginViewController).delegate).toNot(beNil())
        }
      }
      
      context("When didLogin is called") {
        var finishModuleIsCalled = false
        sut.finishModule = { user in
          finishModuleIsCalled = true
        }
        
        sut.didLogin(user: User())
        
        it("Should call finishModule") {
          expect(finishModuleIsCalled).to(beTrue())
        }
      }
      
      context("When didPressedUseTerms is called") {
        
        beforeEach {
          sut.start()
          sut.didPressedUseTerms()
        }
        
        it("Should have useTermsCoordinator not nil") {
          expect(sut.useTermsCoordinator).toNot(beNil())
        }
      }
      
      context("When useTermsCoordinator finishModule is called") {
        
        beforeEach {
          sut.didPressedUseTerms()
          sut.useTermsCoordinator.finishModule!()
        }
        
        it("Should set useTermsCoordinator to nil") {
          expect(sut.useTermsCoordinator).to(beNil())
        }
      }
      
      
    }
  }
}
