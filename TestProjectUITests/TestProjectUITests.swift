//
//  TestProjectUITests.swift
//  TestProjectUITests
//
//  Created by Leo on 2020/8/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import XCTest

class TestProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
     * 历史数据
     */
    func testReqHistory() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["请求历史"].tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    /*
     *刷新新增数据
     */
    func testUpdateNewData() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["请求历史"].tap()
        let table1 = app.tables.element(boundBy: 0)
        table1.swipeDown()
        
        sleep(2)
        XCTAssert(true)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
