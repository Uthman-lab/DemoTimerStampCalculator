//
//  ContentView.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var seconds = Date()
    var body: some View {
        VStack {
            Text("\(format(date: seconds)) seconds")
                .onReceive(timer, perform: { value in
                    seconds = value
                })
            HStack {
                Button(action: {
                    timer.upstream.connect().cancel()
                }) {
                    Text("Pauuse")
                }
                Button(action: {
                  timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }) {
                    Text("Start")
                }
            }
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
