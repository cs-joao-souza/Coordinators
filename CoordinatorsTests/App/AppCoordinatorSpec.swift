//
//  ContentCoordinator.swift
//  Coordinators
//
//  Created by Joao Souza on 22/03/17.
//  Copyright © 2017 JoaoSouza. All rights reserved.
//

import Quick
import Nimble
@testable import Coordinators

class AppCoordinatorSpec: QuickSpec {

  override func spec() {
    describe("AppCoordinator") {
      
      let navigationController = UINavigationController()
      let window = UIWindow()
      let sut = AppCoordinator(window: window, rootViewController: navigationController)
      
      context("When it is initalizing") {
        it("Should have a rootViewController not nil") {
          expect(sut.rootViewController).toNot(beNil())
        }
        
        it("Should have a window not nil") {
          expect(sut.window).toNot(beNil())
        }
      }
      
      context("When it starts") {
        
        beforeEach {
          sut.start()
        }
        
        it("Should have the window's rootViewController equals to AppCoordinator rootViewController") {
          expect(sut.window.rootViewController).to(equal(sut.rootViewController))
        }
        
        it("Should have a LoginViewController as first viewcontroller in RootViewController") {
          expect(sut.rootViewController.viewControllers.first?.isKind(of: LoginViewController.self)).to(beTrue())
        }
        
        it("Should have LoginCoordinator not nil") {
          expect(sut.loginCoordinator).toNot(beNil())
        }
        
        it("Should loginCoordinator has a finishModule") {
          expect(sut.loginCoordinator.finishModule).toNot(beNil())
        }
      }
      
      context("When loginCoordinator finishModule is called") {
        
        beforeEach {
          sut.start()
          sut.loginCoordinator.finishModule!(User())
        }
        
        it("Should set loginCoordinator to nil") {
          expect(sut.loginCoordinator).to(beNil())
        }
        
        it("Should have a ContentViewController as first viewcontroller in RootViewController") {
          expect(sut.rootViewController.viewControllers.first?.isKind(of: ContentViewController.self)).toEventually(beTrue(), timeout: 2)
        }
        
        it("Should have ContentCoordinator not nil") {
          expect(sut.contentCoordinator).toNot(beNil())
        }
        
        it("Should contentCoordinator have a finishModule") {
          expect(sut.contentCoordinator.finishModule).toNot(beNil())
        }
      }
      
      context("When showContent is called") {
        beforeEach {
          sut.showContent()
        }
        
        it("Should set loginCoordinator to nil") {
          expect(sut.loginCoordinator).to(beNil())
        }
        
        it("Should have a ContentViewController as first viewcontroller in RootViewController") {
          expect(sut.rootViewController.viewControllers.first?.isKind(of: ContentViewController.self)).toEventually(beTrue(), timeout: 2)
        }
        
        it("Should have ContentCoordinator not nil") {
          expect(sut.contentCoordinator).toNot(beNil())
        }
        
        it("Should contentCoordinator have a finishModule") {
          expect(sut.contentCoordinator.finishModule).toNot(beNil())
        }
      }
      
      context("When contentCoordinator finishModule isCalled") {
        beforeEach {
          sut.showContent()
          sut.contentCoordinator.finishModule!()
        }
        
        
        it("Should have a LoginViewController as first viewcontroller in RootViewController") {
          expect(sut.rootViewController.viewControllers.first?.isKind(of: LoginViewController.self)).toEventually(beTrue(), timeout: 2)
        }
        
        it("Should have LoginCoordinator not nil") {
          expect(sut.loginCoordinator).toNot(beNil())
        }
        
        it("Should loginCoordinator has a finishModule") {
          expect(sut.loginCoordinator.finishModule).toNot(beNil())
        }

      }
    }
  }
}
