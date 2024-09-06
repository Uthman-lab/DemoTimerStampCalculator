//
//  ContentView.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timerViewModel = TimerCalculatorViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            VStack {
                Text("\(DateHelper.format(date: timerViewModel.date))")
                    .font(.largeTitle)
            }
            .foregroundColor(.white)
            ControlsView(
                timerIsActive: $timerViewModel.isTimerActive,
                stopTimerAction: timerViewModel.stopTimer,
                startTimerAction: timerViewModel.tick,
                resetTimerAction: timerViewModel.resetTimer
            )
            List {
                ForEach(timerViewModel.dates, id: \.self) { date in
                    Text(DateHelper.format(date: date))}
            }
            .labelStyle(.titleAndIcon)
            .listStyle(.plain)
            
        }
        .padding()
        .background(.black.opacity(0.8))
    }
}

struct TimerControl: View {
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
        }
        
    }
}

struct ControlsView: View {
    @Binding var timerIsActive: Bool
    let stopTimerAction: () -> Void
    let startTimerAction: () -> Void
    let resetTimerAction: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            TimerControl(
                iconName: timerIsActive ? "pause" : "play" ,
                action: timerIsActive ? stopTimerAction :
                    startTimerAction
            )
            TimerControl(iconName: "gobackward",
                         action: resetTimerAction
            )
        }
        .font(.headline)
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
