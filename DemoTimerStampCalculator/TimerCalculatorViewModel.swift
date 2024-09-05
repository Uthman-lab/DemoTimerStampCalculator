//
//  TimerCalculatorViewModel.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import Foundation


final class TimerCalculatorViewModel: ObservableObject {
    @Published var seconds = 0
    
    @Published var date: String = ""
    private var timer: Timer? = nil
    @Published var dates: [Date] = []
    
    
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    func tick() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] t in
            self?.date = t.fireDate.ISO8601Format( .iso8601Date(timeZone: .current, dateSeparator: .dash))
            print(t.fireDate)
        }
       // self.timer?.fire()
    }
}
