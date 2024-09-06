//
//  DemoTimerStampCalculatorApp.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/4/24.
//

import SwiftUI

@main
struct DemoTimerStampCalculatorApp: App {
    let isProduction: Bool = {
     NSClassFromString("XCTestCase") == nil
    }()
    
    var body: some Scene {
        WindowGroup {
            if isProduction {
                ContentView()
            } else {
                TestApp()
            }
        }
    }
}

struct TestApp: View {
    var body: some View {
       EmptyView()
    }
}
