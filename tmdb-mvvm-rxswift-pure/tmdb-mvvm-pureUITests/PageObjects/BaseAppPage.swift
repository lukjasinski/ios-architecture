//
//  BaseAppPage.swift
//  tmdb-mvvm-pureUITests
//
//  Created by ljasinski on 23/06/2021.
//  Copyright © 2021 tailec. All rights reserved.
//

import XCTest

class BaseAppPage {
    var app: XCUIApplication

    init(application: XCUIApplication) {
        app = application
    }
}
