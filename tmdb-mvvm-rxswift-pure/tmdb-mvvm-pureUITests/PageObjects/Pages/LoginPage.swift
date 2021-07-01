//
//  LoginPage.swift
//  tmdb-mvvm-pureUITests
//
//  Created by ljasinski on 28/06/2021.
//  Copyright © 2021 tailec. All rights reserved.
//

import XCTest

final class LoginPage: BaseAppPage {
    
    // Elements
    private var usernameTextField: XCUIElement {
        app.textFields["Your username"].firstMatch
    }
    
    private var passwordTextField: XCUIElement {
        app.textFields["Your password"].firstMatch
    }

    private var signInButton: XCUIElement {
        app.buttons["Sign in"].firstMatch
    }
    
    // Actions
    func typeUsername(username: String) {
        usernameTextField.tap()
        usernameTextField.typeText(username)
    }
    
    func typePassword(password: String) {
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }

    func signIn() {
        app.keyboards.buttons["Return"].tap()
        signInButton.tap()
    }
}
