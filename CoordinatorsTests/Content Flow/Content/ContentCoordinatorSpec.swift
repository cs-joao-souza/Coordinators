//
//  ContentCoordinator.swift
//  Coordinators
//
//  Created by Joao Souza on 23/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class ContentCoordinatorSpec: QuickSpec {
  override func spec() {
    describe("ContentCoordinator") {
      
      let navigationController = UINavigationController()
      let sut = ContentCoordinator(rootViewController: navigationController)
      
      context("When it is initalizing") {
        it("Should has a rootViewController not nil") {
          expect(sut.rootViewController).toNot(beNil())
        }
      }
      
      context("When it starts") {
        
        beforeEach {
          sut.start()
        }
        
        it("Should have a ContentViewContoller as first viewcontroller in RootViewController") {
          expect(sut.rootViewController.viewControllers.first?.isKind(of: ContentViewController.self)).to(beTrue())
        }
        
        it("Should have a ContentViewController delegate setted") {
          expect((sut.rootViewController.viewControllers.first as! ContentViewController).delegate).toNot(beNil())
        }
      }
      
      context("When didLogout is called") {
        var finishModuleIsCalled = false
        sut.finishModule = { user in
          finishModuleIsCalled = true
        }
        
        sut.didLogout()
        
        it("Should call finishModule") {
          expect(finishModuleIsCalled).to(beTrue())
        }
      }
      
    }
  }
}
