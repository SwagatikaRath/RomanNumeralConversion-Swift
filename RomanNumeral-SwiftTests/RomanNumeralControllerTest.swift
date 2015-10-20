//
//  RomanNumeralControllerTest.swift
//  RomanNumeral-Swift
//
//  Created by Swagatika on 9/28/15.
//  Copyright (c) 2015 swagatika. All rights reserved.
//

import UIKit
import XCTest




class RomanNumeralControllerTest: XCTestCase {

    var viewController: ViewController!
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testRomanNumeralMatched() {
     
        XCTAssertEqual(viewController.romanToDecimal("V"),5, "Equal")
        XCTAssertEqual(viewController.romanToDecimal("iV"),4, "Equal")
        XCTAssertEqual(viewController.romanToDecimal("Vi"),6, "Equal")
        XCTAssertEqual(viewController.romanToDecimal("Vii"),8, "Equal")
    }
    
    func testRomanNotValid() {
    
        XCTAssert(!viewController.isValidForRoman("HHHHHHH"));
        XCTAssert(!viewController.isValidForRoman("M56*%@"));
   }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
