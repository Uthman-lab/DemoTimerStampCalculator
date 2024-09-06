//
//  TimerCalculatorViewModel.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import Foundation


final class TimerCalculatorViewModel: ObservableObject {
    init(timer: Timer? = nil) {
        self.timer = timer
    }
    
    // MARK: public variables
    @Published var seconds = 0
    @Published var startDate = Date()
    @Published var date: Date = Date()
    @Published var dates: [Date] = []
    let interval: TimeInterval = 1
    
    // MARK: private variables
    
    private var timer: Timer? = nil
    var timerValue: Timer? {
        timer
    }
    
    // MARK: public functions
    
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    func tick() {
        print("hello")
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { t in
            self.date = t.fireDate
            print("printing")
            self.recordIntervals(date: t.fireDate)
        }
    }
    
    // MARK: private functions
    
    private func recordIntervals(date: Date) {
        let difference = calculateInterval()
        if difference % 5 == 0 {
            dates.append(date)
        }
    }
    
    private func calculateInterval() -> Int {
        Int(date.timeIntervalSince1970 - startDate.timeIntervalSince1970)
    }
}

