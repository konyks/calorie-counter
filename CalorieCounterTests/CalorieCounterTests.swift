//
//  CalorieCounterTests.swift
//  CalorieCounterTests
//
//  Created by Serhiy Konyk on 11/2/15.
//  Copyright (c) 2015 Serhiy Konyk. All rights reserved.
//

import UIKit
import XCTest

class CalorieCounterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //TEST CASES for BMRCalculator.swift
    //Test toKillograms function
    func testGetBMR(){
        var myBMR = BMRCalculator()
        //test for Male
        var resultM = myBMR.getBMR(190, height: 72, age: 22, gender: "Male")
        XCTAssert(resultM == 2019, "Pass - \(__LINE__)")
        //test for Female
        var resultF = myBMR.getBMR(190, height: 72, age: 22, gender: "Female")
        XCTAssert(resultF == 1724, "Pass - \(__LINE__)")
    }
    
    //Test getRemaining function
    func testGetRemaining(){
        var myBMR = BMRCalculator()
        var remaining = myBMR.getRemaining(100, current: 20)
        XCTAssert(remaining == 80, "Pass - \(__LINE__)")
    }
    
    func testPerformanceGetBMR(){
        self.measureBlock() {
            for(var i = 0; i < 100; i++){
                var myBMR = BMRCalculator()
                var resultM = myBMR.getBMR(190, height: 72, age: 22, gender: "Male")
                var resultF = myBMR.getBMR(190, height: 72, age: 22, gender: "Female")
            }
        }
    }
    
    //TEST CASES for PrecentageCalculator.swift
    
    //Test getCurrentPrecentage
    func testGetCurrentPrecentage()
    {
        var myPrec = PrecentageCalculator()
        var current = myPrec.getCurrentPrecentage(10, target: 25)
        XCTAssert(current == 40.0, "Pass - \(__LINE__)")
    }
    
    //Test getRemainingPrecentage
    func testGetRemaingPrecentage(){
        var myPrec = PrecentageCalculator()
        var remaining = myPrec.getRemainingPrecentage(100, target: 25)
        XCTAssert(remaining == 400.0, "Pass - \(__LINE__)")
        remaining = myPrec.getRemainingPrecentage(25, target: 100)
        XCTAssert(remaining == 25.0, "Pass - \(__LINE__)")
        remaining = myPrec.getRemainingPrecentage(-25, target: 100)
        XCTAssert(remaining == 0.0, "Pass - \(__LINE__)")
    }
    
}
