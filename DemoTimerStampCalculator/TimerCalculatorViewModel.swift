//
//  TimerCalculatorViewModel.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import Foundation


final class TimerCalculatorViewModel: ObservableObject {
    
    // MARK: life cycle methods
    
    init(timer: Timer? = nil) {
        self.timer = timer
        tick()
    }
    
    // MARK: public variables
    
    @Published var seconds = 0
    @Published var startDate = Date()
    @Published var date: Date = Date()
    @Published var dates: [Date] = []
    @Published var isTimerActive = false
    let interval: TimeInterval = 1
    let intervalToRecordDatesInSeconds = 20
    
    // MARK: private variables
    
    private var timer: Timer? = nil
    var timerValue: Timer? {
        timer
    }
    
    // MARK: public functions
    
    func stopTimer() {
        timer?.invalidate()
        isTimerActive = false
        timer = nil
    }
    
    func tick() {
        stopTimer()
        isTimerActive = true
        self.timer = Timer.scheduledTimer(
            withTimeInterval: interval,
            repeats: true
        ) { t in
            self.date = t.fireDate
            self.recordIntervals(date: t.fireDate)
        }
    }
    
    func resetTimer() {
        date = startDate
        stopTimer()
    }
    
    // MARK: private functions
    
    private func recordIntervals(date: Date) {
        let difference = calculateInterval()
        if difference % intervalToRecordDatesInSeconds == 0 {
            dates.append(date)
        }
    }
    
    private func calculateInterval() -> Int {
        Int(date.timeIntervalSince1970 - startDate.timeIntervalSince1970)
    }
}

