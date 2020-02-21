//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var textField: XCUIElement {
        return app.textFields["Create a new thread:"]
    }

    var cell: XCUIElement {
        return app.cells.element(boundBy: 0)
    }
    
    var firstButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
    var secondButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 1)
    }

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testThreadCreation() {
        textField.tap()
        textField.typeText("test\n")
        sleep(1)
        XCTAssertTrue(cell.exists)
    }
    
    func testMessageCreation() {
        testThreadCreation()
        cell.tap()
        secondButton.tap()
        sleep(2)
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].typeText("testName")
        app.textViews.element(boundBy: 0).tap()
        app.textViews.element(boundBy: 0).typeText("testMessage")
        secondButton.tap()
        firstButton.tap()
        XCTAssertTrue(cell.exists)
    }
    
    func testNavigating() {
        testThreadCreation()
        cell.tap()
        secondButton.tap()
        firstButton.tap()
        firstButton.tap()
    }
    
    func testInformation() {
        textField.tap()
        textField.typeText("test\n")
        sleep(2)
        XCTAssert(app.staticTexts["test"].exists)
        cell.tap()
        secondButton.tap()
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].typeText("testName")
        app.textViews.element(boundBy: 0).tap()
        app.textViews.element(boundBy: 0).typeText("testMessage")
        secondButton.tap()
        XCTAssert(app.staticTexts["testMessage"].exists)
        firstButton.tap()
    }
    
}
