//
//  ContentView.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var timerViewModel = TimerCalculatorViewModel()
    var timerIsActive: Bool {
        timerViewModel.timerValue != nil
    }
    var body: some View {
        VStack {
            VStack {
                Text("\(format(date: timerViewModel.date))")
                    .font(.largeTitle)
                    
                    
                HStack(alignment: .top) {
                   TimerControl(
                    iconName: timerIsActive ? "play" : "pause",
                    action: timerIsActive ? timerViewModel.pause : timerViewModel.tick
                   )
                
                    
                    Button(action: {
                        timerViewModel.resetTimer()
                    }) {
                        Text("Reset")
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
           
            
            
            List {
                ForEach(timerViewModel.dates, id: \.self) { date in
                Text(format(date: date))}
            }
            .labelStyle(.titleAndIcon)
            .listStyle(.plain)
            
        }
        .padding()
        .background(.black.opacity(0.8))
    }

    func format(date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm ss a"
        return dateFormater.string(from: date)
    }
}

struct TimerControl: View {
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Image(systemName: iconName)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    ContentView()
}
