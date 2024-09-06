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
    
    func testPause() {
        // Given
        viewModel.tick()
        
        // When
        viewModel.pause()
        
        // Then
        XCTAssertEqual(viewModel.timerValue, nil)
    }
}
