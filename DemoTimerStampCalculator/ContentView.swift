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
        VStack {
            Text("\(format(date: timerViewModel.date))")
                
            HStack(alignment: .top) {
                Button(action: {
                    timerViewModel.pause()
                }) {
                    Text("Pause")
                }
                Button(action: {
                    timerViewModel.tick()
                }) {
                    Text("Start")
                }
            }
            
            List {
                ForEach(timerViewModel.dates, id: \.self) { date in
                Text(format(date: date))}
            }
            .labelStyle(.titleAndIcon)
            .listStyle(.plain)
            
        }
        .padding()
    }

    func format(date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm ss a"
        return dateFormater.string(from: date)
    }
}

#Preview {
    ContentView()
}
