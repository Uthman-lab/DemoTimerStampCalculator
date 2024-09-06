//
//  TimerCalculatorViewModel.swift
//  DemoTimerStampCalculatorTests
//
//  Created by AMALITECH-PC-593 on 9/5/24.
//

import XCTest
@testable import DemoTimerStampCalculator

final class TimerCalculatorViewModelTest: XCTestCase {
    
    var viewModel: TimerCalculatorViewModel!
    var timer: Timer? = nil
    
    override func setUpWithError() throws {
       viewModel = TimerCalculatorViewModel(timer: timer)
    }

    override func tearDownWithError() throws {
       viewModel = nil
        timer = nil
    }
    
    func testPause_ShouldSetTimerToNil() {
        // Given
        viewModel.tick()
        
        // When
        viewModel.stopTimer()
        
        // Then
        XCTAssertEqual(viewModel.timerValue, nil)
    }
    
    func testReset_ShouldSetDateToStartDate() {
        // Given
        viewModel.tick()
        
        // When
        viewModel.resetTimer()
        
        // Then
        XCTAssertEqual(viewModel.date, viewModel.startDate)
    }
    
    func testReset_ShouldSetTimerValueToNil() {
        // Given
        viewModel.tick()
        
        // When
        viewModel.resetTimer()
        
        // Then
        XCTAssertEqual(viewModel.timerValue, nil)
    }
}
