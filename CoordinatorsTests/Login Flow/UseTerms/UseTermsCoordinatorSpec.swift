//
//  UseTermsCoordinatorSpec.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class UseTermsCoordinatorSpec: QuickSpec {
  override func spec() {
    describe("UseTermsCoordinator") {
      
      let navigationController = UINavigationController(rootViewController: UIViewController())
      UIApplication.shared.keyWindow?.rootViewController = navigationController
      UIApplication.shared.keyWindow?.makeKeyAndVisible()
      let sut = UseTermsCoordinator(rootViewController: navigationController)
      
      context("When it is initalizing") {
        it("Should has a rootViewController not nil") {
          expect(sut.rootViewController).toNot(beNil())
        }
      }
      
      context("When it starts") {
        
        beforeEach {
          sut.start()
        }
        
        it("Should have a UINavigationController presented") {
          expect(sut.rootViewController.presentedViewController?.isKind(of: UINavigationController.self)).toEventually(beTrue(), timeout: 4)
        }
        
        it("Should have a UseTermsViewController as first ViewController of Presented NavigationController") {
          expect( ((sut.rootViewController.presentedViewController) as! UINavigationController).viewControllers.first?.isKind(of: UseTermsViewController.self)).toEventually(beTrue(), timeout: 4)
        }
      }
      
      context("When close is called") {
        var finishModuleIsCalled = false
        sut.finishModule = { user in
          finishModuleIsCalled = true
        }
        
        sut.didClose()
        
        it("Should call finishModule") {
          expect(finishModuleIsCalled).to(beTrue())
        }
      }
      
      
    }
  }
}
