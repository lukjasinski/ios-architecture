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
        XCTAssertTrue(errorAlert.waitForExistence(timeout: defaultTimeout), "Error message is not displayed after \(defaultTimeout) seconds for ivalid username.")
        dismissErrorAlertButton.tap()
        XCTAssertTrue(userNameTextField.isHittable, "Username field is not visible.")
        XCTAssertTrue(passwordSecureTextField.isHittable, "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && signInButton.isEnabled, "Sign In button is not visible or is disabled.")
    }
    
    func testLoginFailsWhenPasswordIsInvalid() {
        // TEST DATA
        let validUsername = "iostest"
        let invalidPassword = "InvalidPassword"
        let defaultTimeout: TimeInterval = 15
        
        // Launch the App
        let app = XCUIApplication()
        app.launch()
            
        // UI Elements
        let userNameTextField = app.textFields["Your username"].firstMatch
        let passwordSecureTextField = app.secureTextFields["Your password"].firstMatch
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
        let errorAlert = app.alerts["Oops!"]
        let dismissErrorAlertButton = errorAlert.buttons["OK"]
        
        // type valid username
        userNameTextField.tap()
        userNameTextField.typeText(validUsername)
        // type invalid password
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(invalidPassword)
        // dismiss keyboard
        returnKey.tap()
        // tap Sign In
        signInButton.tap()

        // Check error message is displayed and user remains on login screen
        XCTAssertTrue(errorAlert.waitForExistence(timeout: defaultTimeout), "Error message is not displayed after \(defaultTimeout) seconds for invalid password.")
        dismissErrorAlertButton.tap()
        XCTAssertTrue(userNameTextField.isHittable, "Username field is not visible.")
        XCTAssertTrue(passwordSecureTextField.isHittable, "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && signInButton.isEnabled, "Sign In button is not visible or is disabled.")
        
        }
        
    func testSignInButtonIsDisabledWhenPasswordIsEmpty() {
        // TEST DATA
        let validUsername = "iostest"
            
        // Launch the App
        let app = XCUIApplication()
        app.launch()
            
        // UI Elements
        let userNameTextField = app.textFields["Your username"].firstMatch
        let passwordSecureTextField = app.secureTextFields["Your password"].firstMatch
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
            
        // type valid username
        userNameTextField.tap()
        userNameTextField.typeText(validUsername)
        // dismiss keyboard
        returnKey.tap()
            
        // Check if user remains on login screen and Sign in button is NOT enabled
        XCTAssertTrue(userNameTextField.isHittable, "Username field is not visible.")
        XCTAssertTrue(passwordSecureTextField.isHittable, "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && !signInButton.isEnabled, "Sign In button is not visible or is disabled.")
            
        }
        
    func testSignInButtonIsDisabledWhenUsernameIsEmpty() {
        // TEST DATA
        let validPassword = "test"
            
        // Launch the App
        let app = XCUIApplication()
        app.launch()
            
        // UI Elements
        let userNameTextField = app.textFields["Your username"].firstMatch
        let passwordSecureTextField = app.secureTextFields["Your password"].firstMatch
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
            
        // type valid password
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        // dismiss keyboard
        returnKey.tap()
            
        // Check if user remains on login screen and Sign in button is NOT enabled
        XCTAssertTrue(userNameTextField.isHittable, "Username field is not visible.")
        XCTAssertTrue(passwordSecureTextField.isHittable, "Password field is not visible.")
        XCTAssertTrue(signInButton.isHittable && !signInButton.isEnabled, "Sign In button is not visible or is disabled.")
        }
    
    func testLoginIsSuccessfulForValidCredentials() {
        // TEST DATA
        let validUsername = "iostest"
        let validPassword = "test"
        
        // Lunch the App
        let app = XCUIApplication()
        app.launch()
        
        // UI Elements
        let userNameTextField = app.textFields["Your username"].firstMatch
        let passwordSecureTextField = app.secureTextFields["Your password"].firstMatch
        let signInButton = app.buttons["Sign in"].firstMatch
        let returnKey = app.keyboards.buttons["Return"].firstMatch
        
        // type valid username
        userNameTextField.tap()
        userNameTextField.typeText(validUsername)
        // type password
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        // dismiss keyboard
        returnKey.tap()
        // tap Sign In
        signInButton.tap()

        // Check if user is logged in
        //XCTAssertTrue(userNameTextField.isHittable, "Username field is not visible.")
        //XCTAssertTrue(passwordSecureTextField.isHittable, "Password field is not visible.")
        //XCTAssertTrue(signInButton.isHittable && signInButton.isEnabled, "Sign In button is not visible or is disabled.")
    }
}
