//
//  DateHelper.swift
//  DemoTimerStampCalculatorTests
//
//  Created by AMALITECH-PC-593 on 9/6/24.
//

import XCTest
@testable import DemoTimerStampCalculator

final class DateHelperTest: XCTestCase {
    
    func testFormat_shouldReturnAFormatedString() {
        // Given
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm ss a"
        let expectedDate = dateFormater.string(from: date)
        
        // When
        let formatedValue = DateHelper.format(date: date)
        
        // Then
        XCTAssertEqual(formatedValue, expectedDate)
    }

}
