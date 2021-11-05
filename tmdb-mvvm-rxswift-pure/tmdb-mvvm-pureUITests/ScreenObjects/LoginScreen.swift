//
//  LoginScreen.swift
//  tmdb-mvvm-pureUITests
//
//  Created by Mateusz Nicpoń on 02/11/2021.
//  Copyright © 2021 tailec. All rights reserved.
//

import Foundation
import XCTest

open class LoginScreen {
    private var app: XCUIApplication
    
    init(application: XCUIApplication) {
        app = application
    }
    
    // MARK: Elements
    private var userNameTextField: XCUIElement {
        return app.textFields["Your username"].firstMatch
    }
    
    private var passwordSecureTextField: XCUIElement {
        return app.secureTextFields["Your password"].firstMatch
    }
    
    // MARK: Actions
    func type(username: String) {
        tapUsernameField()
        userNameTextField.typeText(username)
    }
    
    func type(password: String) {
        tapPasswordField()
        passwordSecureTextField.typeText(password)
    }
    
    func tapUsernameField() {
        userNameTextField.tap()
    }
    
    func tapPasswordField() {
        passwordSecureTextField.tap()
    }
    
    // MARK: Helpers
    func isUsernameFieldVisible() -> Bool {
        return userNameTextField.isHittable
    }
    
    func isPasswordFieldVisible() -> Bool {
        return passwordSecureTextField.isHittable
    }
}
