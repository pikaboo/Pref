//
//  PrefTests.swift
//  PrefTests
//
//  Created by Lena Brusilovski on 22/10/2018.
//  Copyright © 2018 Lena Brusilovski. All rights reserved.
//

import XCTest
@testable import Pref

class PrefTests: XCTestCase {

    var prefs: UserDefaults!
    var prefUnderTest: Pref<DummyCodableObject>!
    var dummyCodableObject : DummyCodableObject!
    override func setUp() {
        self.prefs = UserDefaults.standard
        self.prefUnderTest = Pref<DummyCodableObject>(prefs:self.prefs,key:"StamObject")
        self.dummyCodableObject = DummyCodableObject()
        self.dummyCodableObject.name = "Lena"
        self.dummyCodableObject.lastName = "Bru"
    }

    override func tearDown() {
        self.prefUnderTest.clear()
        self.prefs = nil
        self.prefUnderTest = nil
    }

    func testPrefGetEmptyValueReturnsNil(){
        XCTAssertNil(self.prefUnderTest.get())
    }
    
    func testPrefSetValueReturnsTheValueThatWasSet(){
        self.prefUnderTest.set(self.dummyCodableObject)
        let storedDummyCodableObject = self.prefUnderTest.get()
        XCTAssertNotNil(storedDummyCodableObject)
        XCTAssertNotNil(storedDummyCodableObject?.name)
        XCTAssertNotNil(storedDummyCodableObject?.lastName)
        XCTAssertEqual((storedDummyCodableObject?.name)!, dummyCodableObject.name)
        XCTAssertEqual((storedDummyCodableObject?.lastName)!, dummyCodableObject.lastName)
    }
    
    func testPrefClearClearsTheValue(){
        self.prefUnderTest.set(self.dummyCodableObject)
        self.prefUnderTest.clear()
        let storedDummyCodableObject = self.prefUnderTest.get()
        XCTAssertNil(storedDummyCodableObject)
    }
    
    func testPrefSendsEventAboutWillSet(){
        self.expectation(forNotification: self.prefUnderTest!.willSetNotificationName, object: nil) { (note) -> Bool in
            return true
        }
        self.prefUnderTest.set(self.dummyCodableObject)
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPrefSendsEventAboutDidSet(){
        self.expectation(forNotification: self.prefUnderTest!.didSetNotificationName, object: nil) { (note) -> Bool in
            return true
        }
        self.prefUnderTest.set(self.dummyCodableObject)
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGettingPreviouslyStoredValue(){
        let dummyCodableObject = DummyCodableObject()
        dummyCodableObject.name = "Test"
        let anotherPref =  Pref<DummyCodableObject>(prefs:self.prefs,key:"StamObject")
        anotherPref.set(dummyCodableObject)
        let storedValue = self.prefUnderTest.get()
        XCTAssertNotNil(storedValue)
        XCTAssertEqual((storedValue?.name)!, dummyCodableObject.name)
    }
}
