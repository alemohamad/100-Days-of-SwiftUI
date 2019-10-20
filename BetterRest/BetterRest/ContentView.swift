//
//  ContentView.swift
//  BetterRest
//
//  Created by Ale Mohamad on 19/10/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmmount = 8.0
    @State private var coffeeAmmount = 1
    
    var sleepingTime: String {
        get {
            return calculateBedtime()
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Desired ammount of sleep")) {
                    Stepper(value: $sleepAmmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker("Daily coffee intake", selection: $coffeeAmmount) {
                        ForEach(1...20, id: \.self) { ammount in
                            Text(ammount == 1 ? "1 cup" : "\(ammount) cups")
                        }
                    }
                }
                
                Section(header: Text("Your ideal bedtime is")) {
                    Text(sleepingTime)
                        .font(.largeTitle)
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmmount, coffee: Double(coffeeAmmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
