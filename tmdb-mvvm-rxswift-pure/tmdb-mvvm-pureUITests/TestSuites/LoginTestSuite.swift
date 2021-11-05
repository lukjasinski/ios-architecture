//
//  LoginTestSuite.swift
//  tmdb-mvvm-pureUITests
//
//  Created by Mateusz Nicpoń on 27/09/2021.
//  Copyright © 2021 tailec. All rights reserved.
//

import XCTest

class LoginTestSuite: XCTestCase {
    var app = XCUIApplication()
    lazy var loginScreen = LoginScreen(application: app)

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    private func waitFor(element: XCUIElement) {
        var timeInterval = 10
        while (!element.isHittable) {
            sleep(1)
            timeInterval -= 1
            print("Wartosc timeInterval = \(timeInterval)")
            if timeInterval <= 0 {
                break
            }
        }
    }
    
    func testLoginFailsWhenUsernameIsInvalid() {
        // TEST DATA
        let invalidUsername = "InvalidUsername"
        let validPassword = "test"
        
        let defaultTimeout: TimeInterval = 15
        // UI Elements
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
        let errorAlert = app.alerts["Oops!"]
        let dismissErrorAlertButton = errorAlert.buttons["OK"]
        
        
        // type invalid username
        loginScreen.type(username: invalidUsername)
        // type password
        loginScreen.type(password: validPassword)
        // dismiss keyboard
        returnKey.tap()
        // tap Sign In
        signInButton.tap()

        // Check error message is displayed and user remains on login screen
        XCTAssertTrue(errorAlert.waitForExistence(timeout: defaultTimeout), "Error message is not displayed after \(defaultTimeout) seconds for ivalid username.")
        dismissErrorAlertButton.tap()
        XCTAssertTrue(loginScreen.isUsernameFieldVisible(), "Username field is not visible.")
        XCTAssertTrue(loginScreen.isPasswordFieldVisible(), "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && signInButton.isEnabled, "Sign In button is not visible or is disabled.")
    }
    
    func testLoginFailsWhenPasswordIsInvalid() {
        // TEST DATA
        let validUsername = "iostest"
        let invalidPassword = "InvalidPassword"
        let defaultTimeout: TimeInterval = 15
            
        // UI Elements
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
        let errorAlert = app.alerts["Oops!"]
        let dismissErrorAlertButton = errorAlert.buttons["OK"]
        
        // type valid username
        loginScreen.type(username: validUsername)
        // type invalid password
        loginScreen.type(password: invalidPassword)
        // dismiss keyboard
        returnKey.tap()
        // tap Sign In
        signInButton.tap()

        // Check error message is displayed and user remains on login screen
        XCTAssertTrue(errorAlert.waitForExistence(timeout: defaultTimeout), "Error message is not displayed after \(defaultTimeout) seconds for invalid password.")
        dismissErrorAlertButton.tap()
        XCTAssertTrue(loginScreen.isUsernameFieldVisible(), "Username field is not visible.")
        XCTAssertTrue(loginScreen.isPasswordFieldVisible(), "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && signInButton.isEnabled, "Sign In button is not visible or is disabled.")
        
        }
        
    func testSignInButtonIsDisabledWhenPasswordIsEmpty() {
        // TEST DATA
        let validUsername = "iostest"
            
        // UI Elements
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
            
        // type valid username
        loginScreen.type(username: validUsername)
        // dismiss keyboard
        returnKey.tap()
            
        // Check if user remains on login screen and Sign in button is NOT enabled
        XCTAssertTrue(loginScreen.isUsernameFieldVisible(), "Username field is not visible.")
        XCTAssertTrue(loginScreen.isPasswordFieldVisible(), "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && !signInButton.isEnabled, "Sign In button is not visible or is disabled.")
            
        }
        
    func testSignInButtonIsDisabledWhenUsernameIsEmpty() {
        // TEST DATA
        let validPassword = "test"
            
        // UI Elements
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
            
        // type valid password
        loginScreen.type(password: validPassword)
        // dismiss keyboard
        returnKey.tap()
            
        // Check if user remains on login screen and Sign in button is NOT enabled
        XCTAssertTrue(loginScreen.isUsernameFieldVisible(), "Username field is not visible.")
        XCTAssertTrue(loginScreen.isPasswordFieldVisible(), "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && !signInButton.isEnabled, "Sign In button is not visible or is disabled.")
        }
    
    func testLoginIsSuccessfulForValidCredentials() {
        // TEST DATA
        let validUsername = "iostest"
        let validPassword = "test"
        
        // UI Elements
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
        let searchButton = app.buttons["Search"].firstMatch
        
        // type valid username
        loginScreen.type(username: validUsername)
        // type password
        loginScreen.type(password: validPassword)
        // dismiss keyboard
        returnKey.tap()
        // tap Sign In
        signInButton.tap()
        
        
        // Check if the user is logged in
        waitFor(element: searchButton)
        
        XCTAssertTrue(searchButton.isHittable, "Search button is not visible or is disabled.")
    }
}
