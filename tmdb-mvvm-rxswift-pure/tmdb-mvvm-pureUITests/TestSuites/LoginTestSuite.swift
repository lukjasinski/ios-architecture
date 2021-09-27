//
//  LoginTestSuite.swift
//  tmdb-mvvm-pureUITests
//
//  Created by Mateusz Nicpoń on 27/09/2021.
//  Copyright © 2021 tailec. All rights reserved.
//

import XCTest

class LoginTestSuite: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testLoginFailsWhenUsernameIsInvalid() {
        // TEST DATA
        let invalidUsername = "InvalidUsername"
        let validPassword = "test"
        let defaultTimeout: TimeInterval = 15
        
        // Lunch the App
        let app = XCUIApplication()
        app.launch()
        
        // UI Elements
        let userNameTextField = app.textFields["Your username"].firstMatch
        let passwordSecureTextField = app.secureTextFields["Your password"].firstMatch
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
        let errorAlert = app.alerts["Oops!"]
        let dismissErrorAlertButton = errorAlert.buttons["OK"]
        
        
        // type invalid username
        userNameTextField.tap()
        userNameTextField.typeText(invalidUsername)
        // type password
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        // dismiss keyboard
        returnKey.tap()
        // tap Sign In
        signInButton.tap()

        // Check error message is displayed and user remains on login screen
        XCTAssertTrue(errorAlert.waitForExistence(timeout: defaultTimeout),
                      "Error message is not displayed after \(defaultTimeout) seconds for ivalid username.")
        dismissErrorAlertButton.tap()
        
        XCTAssertTrue(userNameTextField.isHittable,
                      "Username field is not visible.")
        XCTAssertTrue(passwordSecureTextField.isHittable,
                      "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && signInButton.isEnabled,
                      "Sign In button is not visible or is disabled.")
    }
    
    func testLoginFailsWhenPasswordIsInvalid() {
        // Lunch the App
        let app = XCUIApplication()
        app.launch()
        // type invalid username
        app.textFields["Your username"].firstMatch.tap()
        app.textFields["Your username"].firstMatch.typeText("iostest")
        // type password
        app.secureTextFields["Your password"].firstMatch.tap()
        app.secureTextFields["Your password"].firstMatch.typeText("invalidPassword")
        // dismiss keyboard
        app.keyboards.buttons["Return"].firstMatch.tap()
        // tap Sign In
        app.buttons["Sign in"].firstMatch.tap()

        // Check error message is displayed and user remains on login screen
        XCTAssertTrue(app.alerts["Oops!"].waitForExistence(timeout: 15))
        app.alerts["Oops!"].buttons["OK"].firstMatch.tap()
        
        XCTAssertTrue(app.textFields["Your username"].firstMatch.isHittable)
        XCTAssertTrue(app.secureTextFields["Your password"].firstMatch.isHittable)
        XCTAssertTrue(app.buttons["Sign in"].firstMatch.isHittable && app.buttons["Sign in"].firstMatch.isEnabled)
    }
    
    func testSignInButtonIsDisabledWhenPasswordIsEmpty() {
        
    }
    
    func testSignInButtonIsDisabledWhenUsernameIsEmpty() {
        
    }
    
    func testLoginIsSuccessfulForValidCredentials() {
        
    }
}
