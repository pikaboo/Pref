//
//  PrefArrayTests.swift
//  PrefTests
//
//  Created by Lena Brusilovski on 22/10/2018.
//  Copyright © 2018 Lena Brusilovski. All rights reserved.
//

import XCTest
@testable import Pref

class PrefArrayTests: XCTestCase {

    var prefs: UserDefaults!
    var prefUnderTest: Pref<[DummyCodableObject]>!
    var dummyCodableObject : DummyCodableObject!
    override func setUp() {
        self.prefs = UserDefaults.standard
        self.prefUnderTest = Pref<[DummyCodableObject]>(prefs:self.prefs,key:"StamObject")
        self.dummyCodableObject = DummyCodableObject()
        self.dummyCodableObject.name = "Lena"
        self.dummyCodableObject.lastName = "Bru"
    }

    override func tearDown() {
        self.prefUnderTest.clear()
        self.prefs = nil
        self.prefUnderTest = nil
    }
    
    func testCanStoreArrayOfCodables(){
        let arrayOfCodables:[DummyCodableObject] = [self.dummyCodableObject]
        self.prefUnderTest.set(arrayOfCodables)
        let storedDummyCodableObject = self.prefUnderTest.get()
        XCTAssertNotNil(storedDummyCodableObject)
        XCTAssertNotNil(storedDummyCodableObject?.first)
    }

}
